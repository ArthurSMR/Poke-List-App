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
}

final class AppFactory {
    
}

extension AppFactory: AppFactoryProtocol {
    
    func makeHome() -> UIViewController {
        
        let homeRouter = HomeRouter()
        let homeInteractor = HomeInteractor()
        
        let homePresenter = HomePresenter()
        homePresenter.set(router: homeRouter,
                          interactor: homeInteractor)
        
        let homeViewController = HomeViewController()
        homeViewController.set(presenter: homePresenter)
        
        homePresenter.delegate = homeViewController
        
        return homeViewController
    }
}
