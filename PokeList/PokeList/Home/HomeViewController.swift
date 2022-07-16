//
//  ViewController.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import UIKit

protocol HomeViewControllerProtocol {
    
}

protocol HomeViewControllerDelegate {
    
}

class HomeViewController: UIViewController {
    
    lazy var homeView: HomeViewProtocol = {
        let view = HomeView()
        view.delegate = self
        return view
    }()
    
    private var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = homeView
    }
    
    func set(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    
}

extension HomeViewController: HomeViewDelegate {
    
}

extension HomeViewController: HomePresenterDelegate {
    
}
