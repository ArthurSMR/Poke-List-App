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
                
                for id in 0..<pokedex.results.count {
                    
                    self?.provider.fetchPokemon(atURL: pokedex.results[id].url) { result in
                        print(result)
                    }
                }
                
            case let .failure(networkError):
                print("Error: \(networkError.localizedDescription)")
            }
        }
    }
}
