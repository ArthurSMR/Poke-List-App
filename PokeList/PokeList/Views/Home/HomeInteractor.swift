//
//  HomeInteractor.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import Foundation

protocol HomeInteractorProtocol {
    func getPokemons()
    func getNextPokemons()
}

protocol HomeInteractorDelegate: AnyObject {
    func didFetchPokedexPage(_ page: PokedexPage)
}

final class HomeInteractor {
    
    let provider: NetworkPokemonProvider
    let pokeAPIURL: URL? = URL(string: "http://pokeapi.co/api/v2/pokemon/")
    var pokedexPage: PokedexPage = PokedexPage()
    
    weak var delegate: HomeInteractorDelegate?
    
    init(provider: NetworkPokemonProvider) {
        self.provider = provider
    }
    
    private func fetchPokedex(atURL url: URL?) {
        
        provider.fetchPokedex(atURL: url) { [weak self] pokedexResult in
            switch pokedexResult {
                
            case let .success(pokedex):
                self?.pokedexPage.pokedex = pokedex
                self?.fetchPokemons(from: pokedex)
                
            case let .failure(networkError):
                print("Error: \(networkError.localizedDescription)")
            }
        }
    }
    
    private func fetchPokemons(from pokedex: PokedexEntity) {
        
        let dispatchGroup = DispatchGroup()
        
        for pokemon in pokedex.results {
            
            dispatchGroup.enter()
            self.provider.fetchPokemon(atURL: pokemon.url) { [weak self] result in
                
                switch result {
                case let .success(pokemonModel):
                    self?.pokedexPage.pokemons.append(pokemonModel)
                    dispatchGroup.leave()
                    
                case let .failure(networkError):
                    print("Error: \(networkError.localizedDescription)")
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.delegate?.didFetchPokedexPage(self.pokedexPage)
        }
    }
}

// MARK: HomeInteractorProtocol
extension HomeInteractor: HomeInteractorProtocol {
    
    func getPokemons() {
        fetchPokedex(atURL: pokeAPIURL)
    }
    
    func getNextPokemons() {
        
        if pokedexPage.hasNextPage {
            let nextAPIPageURL = URL(string: pokedexPage.pokedex.next)
            fetchPokedex(atURL: nextAPIPageURL)
        }
    }
}
