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
}

protocol HomePresenterDelegate: AnyObject {
    func didLoadPokedexPage(_ page: PokedexPage)
}

final class HomePresenter {
    
    private var homeRouter: HomeRouterProtocol?
    private var homeInteractor: HomeInteractorProtocol?
    
    weak var delegate: HomePresenterDelegate?
}

// MARK: HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    
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
        delegate?.didLoadPokedexPage(page)
    }
}
