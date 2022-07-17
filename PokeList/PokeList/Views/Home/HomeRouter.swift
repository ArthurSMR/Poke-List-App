//
//  HomeRouter.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import UIKit

protocol HomeRouterProtocol {
    func routeToPokemonDetails(_ pokemon: PokemonModel)
}

final class HomeRouter {
    
    private let factory: AppFactoryProtocol
    weak var source: UIViewController?
    
    init(factory: AppFactoryProtocol) {
        self.factory = factory
    }
}

// MARK: HomeRouterProtocol
extension HomeRouter: HomeRouterProtocol {
    
    func routeToPokemonDetails(_ pokemon: PokemonModel) {
        
        DispatchQueue.main.async {
            let viewController = self.factory.makePokemonDetails(pokemon)
            self.source?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
