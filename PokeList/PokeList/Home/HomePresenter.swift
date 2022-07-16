//
//  HomePresenter.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import Foundation

protocol HomePresenterProtocol {
    func set(router: HomeRouterProtocol, interactor: HomeInteractorProtocol)
    func presentPokemonList()
}

protocol HomePresenterDelegate: AnyObject {
    func didLoadPokemonList()
}

final class HomePresenter {
    
    private var homeRouter: HomeRouterProtocol?
    private var homeInteractor: HomeInteractorProtocol?
    
    weak var delegate: HomePresenterDelegate?
}

// MARK: HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    
    func presentPokemonList() {
        homeInteractor?.getPokemons()
    }
    
    func set(router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.homeRouter = router
        self.homeInteractor = interactor
    }
}

extension HomePresenter: HomeInteractorDelegate {
    
    func didFetchPokemons(pokemons: [PokemonModel]) {
        print("pokemons \(pokemons)")
    }
}
