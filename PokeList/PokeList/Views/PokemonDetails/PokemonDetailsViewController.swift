//
//  PokemonDetails.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 17/07/22.
//

import UIKit

final class PokemonDetailsViewController: UIViewController {
    
    lazy var detailsView: PokemonDetailsView = {
        let view = PokemonDetailsView()
        return view
    }()
    
    var pokemon: PokemonEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detailsView.updateView(pokemon: pokemon ?? PokemonEntity())
    }
    
    override func loadView() {
        view = detailsView
    }
}
