//
//  PokemonDetails.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 17/07/22.
//

import UIKit

final class PokemonDetailsViewController: UIViewController {
    
    var pokemon: PokemonEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        title = pokemon?.name
        print(pokemon)
    }
}
