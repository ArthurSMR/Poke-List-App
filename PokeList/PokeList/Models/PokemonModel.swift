//
//  PokemonModel.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import UIKit

struct PokemonModel: Codable {
    var name: String
    var id: Int = 0
    var height = 0
    var sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    var front_default: String?
    
    var frontDefaultAsURL: URL? {
        URL(string: front_default ?? "")
    }
}
