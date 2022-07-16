//
//  HomeWorker.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import Foundation

final class NetworkPokemonProvider {
    
    let pokeAPIURL: String = "http://pokeapi.co/api/v2/pokemon/"
    
}

extension NetworkPokemonProvider: NetworkPokemonQuery {
    
    func fetchAllPokemons(onCompletion: @escaping (NetworkResult<PokedexModel>) -> Void) {
        
        guard let url = URL(string: pokeAPIURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            if let error = error {
                print(error.localizedDescription)
                onCompletion(.failure(.internalError(error)))
            }
            
            if let data = data {
                do {
                    let pokedex = try JSONDecoder().decode(PokedexModel.self, from: data)
                    onCompletion(.success(pokedex))
                } catch {
                    onCompletion(.failure(.unableToMapModel))
                }
            }
        }.resume()
    }
    
    func fetchPokemon(atURL url: URL?, onCompletion: @escaping (NetworkResult<PokemonModel>) -> Void) {
        
        
        guard let url = url else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                onCompletion(.failure(.internalError(error)))
            }
            
            if let data = data {
                do {
                    let pokemon = try JSONDecoder().decode(PokemonModel.self, from: data)
                    onCompletion(.success(pokemon))
                } catch {
                    onCompletion(.failure(.unableToMapModel))
                }
            }
        }.resume()
    }
}
