//
//  HomePresenter.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import Foundation

protocol HomePresenterProtocol {
    func set(router: HomeRouterProtocol, interactor: HomeInteractorProtocol)
    func presentPokedexPage()
    func presentNextPokedexPage()
    func showPokemonDetails(_ pokemon: PokemonEntity)
}

protocol HomePresenterDelegate: AnyObject {
    func didLoadPokedexPage(_ page: PokedexPage)
}

final class HomePresenter {
    
    private var homeRouter: HomeRouterProtocol?
    private var homeInteractor: HomeInteractorProtocol?
    
    weak var delegate: HomePresenterDelegate?
}

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}

// MARK: HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    
    func showPokemonDetails(_ pokemon: PokemonEntity) {
        homeRouter?.routeToPokemonDetails(pokemon)
    }
    
    func presentPokedexPage() {
        homeInteractor?.getPokemons()
    }
    
    func presentNextPokedexPage() {
        homeInteractor?.getNextPokemons()
    }
    
    func set(router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.homeRouter = router
        self.homeInteractor = interactor
    }
}

extension HomePresenter: HomeInteractorDelegate {
    
    func didFetchPokedexPage(_ page: PokedexPage) {
        
        page.capitalizeFirstPokemonLetter()
        
        delegate?.didLoadPokedexPage(page)
    }
}
