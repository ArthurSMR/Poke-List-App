//
//  PokemonModel.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import Foundation

struct PokemonModel {
    var name: String
    var id: Int = 0
    var height = 0
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case height
    }
}

extension PokemonModel: Decodable {
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        height = try values.decode(Int.self, forKey: .height)
    }
}
