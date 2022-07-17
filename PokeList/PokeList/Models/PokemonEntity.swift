//
//  PokemonModel.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import UIKit

struct PokemonEntity: Codable {
    var name: String
    var base_experience: Int
    var id: Int = 0
    var height = 0
    var sprites: PokemonSprites
    var stats: [PokemonStats]
}

struct PokemonSprites: Codable {
    var front_default: String?
    
    var frontDefaultAsURL: URL? {
        URL(string: front_default ?? "")
    }
}

struct PokemonStats: Codable {
    var base_stat: Int
    var stat: PokemonStat
}

struct PokemonStat: Codable {
    var name: String
}
