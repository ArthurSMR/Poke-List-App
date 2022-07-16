//
//  PokedexModel.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import Foundation

struct PokedexModel {
    var count: Int = 0
    var next: String = ""
    var previous: String? = ""
    var results: [Pokemon] = []
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}

extension PokedexModel: Decodable {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        count = try values.decode(Int.self, forKey: .count)
        next = try values.decode(String.self, forKey: .next)
        previous = try values.decode(String?.self, forKey: .previous)
        
        results = try values.decode([Pokemon].self, forKey: .results)
    }
}

struct Pokemon: Decodable {
    let name: String
    let url: URL?
}
