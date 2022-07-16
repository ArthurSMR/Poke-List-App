//
//  HomePresenter.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import Foundation

protocol HomePresenterProtocol {
    
}

protocol HomePresenterDelegate: AnyObject {
    
}

final class HomePresenter {
    
    private var homeRouter: HomeRouterProtocol?
    private var homeInteractor: HomeInteractorProtocol?
    
    weak var delegate: HomePresenterDelegate?
    
    func set(router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.homeRouter = router
        self.homeInteractor = interactor
    }
}

extension HomePresenter: HomePresenterProtocol {
    
}
