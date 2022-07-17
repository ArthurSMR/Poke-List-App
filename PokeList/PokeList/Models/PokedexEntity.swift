//
//  PokedexModel.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import Foundation

struct PokedexEntity: Codable {
    var count: Int = 0
    var next: String = ""
    var previous: String? = ""
    var results: [Pokemon] = []
}

struct Pokemon: Codable {
    let name: String
    let url: URL?
}

final class PokedexPage {
    var pokedex: PokedexEntity = PokedexEntity()
    var pokemons: [PokemonEntity] = []
    var hasNextPage: Bool { !pokedex.next.isEmpty }
    
    func capitalizeFirstPokemonLetter() {
        for index in 0..<pokemons.count {
            pokemons[index].name.capitalizeFirstLetter()
        }
    }
}
