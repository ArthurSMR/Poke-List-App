//
//  HomeInteractor.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import Foundation

protocol HomeInteractorProtocol {
    func getPokemons()
}

protocol HomeInteractorDelegate: AnyObject {
    func didFetchPokemons(pokemons: [PokemonModel])
}

final class HomeInteractor {
    
    let provider: NetworkPokemonProvider
    var pokemonList: [PokemonModel] = []
    
    weak var delegate: HomeInteractorDelegate?
    
    init(provider: NetworkPokemonProvider) {
        self.provider = provider
    }
}

// MARK: HomeInteractorProtocol
extension HomeInteractor: HomeInteractorProtocol {
    
    func getPokemons() {
        
        provider.fetchAllPokemons { [weak self] pokedexResult in
            
            switch pokedexResult {
                
            case let .success(pokedex):
                
                let dispatchGroup = DispatchGroup()
                
                for pokemon in pokedex.results {
                    
                    dispatchGroup.enter()
                    self?.provider.fetchPokemon(atURL: pokemon.url) { result in
                        
                        switch result {
                        case let .success(pokemonModel):
                            self?.pokemonList.append(pokemonModel)
                            dispatchGroup.leave()
                            
                        case let .failure(networkError):
                            print("Error: \(networkError.localizedDescription)")
                        }
                    }
                }
                
                dispatchGroup.notify(queue: .main) {
                    self?.delegate?.didFetchPokemons(pokemons: self?.pokemonList ?? [])
                }
                
            case let .failure(networkError):
                print("Error: \(networkError.localizedDescription)")
            }
        }
    }
}
