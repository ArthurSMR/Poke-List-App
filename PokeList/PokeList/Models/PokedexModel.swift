//
//  PokedexModel.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import Foundation

struct PokedexModel: Codable {
    var count: Int = 0
    var next: String = ""
    var previous: String? = ""
    var results: [Pokemon] = []
}

struct Pokemon: Codable {
    let name: String
    let url: URL?
}
