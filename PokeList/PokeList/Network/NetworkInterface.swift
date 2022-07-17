//
//  NetworkInterafce.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import Foundation

public typealias NetworkResult<T> = Result<T, NetworkError>

public enum NetworkError: Error {
    case invalidURL
    case unableToMapModel
    case internalError(Error)
}

protocol NetworkQuery {}

protocol NetworkPokemonQuery: NetworkQuery {
    func fetchPokedex(atURL url: URL?, onCompletion: @escaping (NetworkResult<PokedexEntity>) -> Void) 
    func fetchPokemon(atURL url: URL?, onCompletion: @escaping (NetworkResult<PokemonEntity>) -> Void)
}
