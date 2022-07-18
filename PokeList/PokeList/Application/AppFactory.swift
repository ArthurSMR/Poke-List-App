//
//  AppFactory.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import Foundation
import UIKit

protocol AppFactoryProtocol {
    func makeHome() -> UIViewController
    func makePokemonDetails(_ pokemon: PokemonEntity) -> UIViewController
}

final class AppFactory {
    
}

extension AppFactory: AppFactoryProtocol {
    
    func makeHome() -> UIViewController {
        
        let homeRouter = HomeRouter(factory: self)
        
        let networkPokemonProvider = NetworkPokemonProvider()
        
        let homeInteractor = HomeInteractor(provider: networkPokemonProvider)
        
        let homePresenter = HomePresenter()
        homePresenter.set(router: homeRouter,
                          interactor: homeInteractor)
        
        homeInteractor.delegate = homePresenter
        
        let homeViewController = HomeViewController()
        homeViewController.set(presenter: homePresenter)
        
        homeRouter.source = homeViewController
        homePresenter.delegate = homeViewController
        
        return homeViewController
    }
    
    func makePokemonDetails(_ pokemon: PokemonEntity) -> UIViewController {
        
        let pokemonDetailVC = PokemonDetailsViewController()
        pokemonDetailVC.pokemon = pokemon
        return pokemonDetailVC
    }
}
