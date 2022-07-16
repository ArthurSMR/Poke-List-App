//
//  ViewController.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import UIKit

protocol HomeViewControllerProtocol {
    func set(presenter: HomePresenterProtocol)
    func loadPokemonList()
    func updateView()
}

final class HomeViewController: UIViewController {
    
    // MARK: Properties
    
    lazy var homeView: HomeViewProtocol = {
        let view = HomeView()
        view.delegate = self
        return view
    }()
    
    private var presenter: HomePresenterProtocol?
    
    // MARK: Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadPokemonList()
    }
    
    override func loadView() {
        view = homeView
    }
}

// MARK: HomeViewControllerProtocol
extension HomeViewController: HomeViewControllerProtocol {
    
    func set(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadPokemonList() {
        presenter?.presentPokemonList()
    }
    
    func updateView() {
        DispatchQueue.main.async {
            self.homeView.updateView()
        }
    }
}

// MARK: HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    
}

// MARK: HomePresenterDelegate 
extension HomeViewController: HomePresenterDelegate {
    
    func didLoadPokemonList() {
        updateView()
    }
}
