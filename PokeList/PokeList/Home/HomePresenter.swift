//
//  HomePresenter.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import Foundation

protocol HomePresenterProtocol {
    func set(router: HomeRouterProtocol, interactor: HomeInteractorProtocol)
}

protocol HomePresenterDelegate: AnyObject {
    
}

final class HomePresenter {
    
    private var homeRouter: HomeRouterProtocol?
    private var homeInteractor: HomeInteractorProtocol?
    
    weak var delegate: HomePresenterDelegate?
}

// MARK: HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    
    func set(router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.homeRouter = router
        self.homeInteractor = interactor
    }
}
