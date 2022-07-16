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
    case statusCodeNotAcceptable
    case errorWithStatusCode(statusCode: Int?, error: Error)
    case notSafeData
    case notJSONSerializable
    case unableToMapModel
    case unableToDetermineDataAsJSON
    case unableToGetUserToken
    case internalError(Error)
}

protocol NetworkQuery {}

protocol NetworkPokemonQuery: NetworkQuery {
    func fetchAllPokemons(onCompletion: @escaping (NetworkResult<PokedexModel>) -> Void)
    func fetchPokemon(atURL url: URL?, onCompletion: @escaping (NetworkResult<PokemonModel>) -> Void)
}
