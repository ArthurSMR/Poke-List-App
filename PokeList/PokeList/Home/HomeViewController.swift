//
//  ViewController.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import UIKit

protocol HomeViewControllerProtocol {
    func set(presenter: HomePresenterProtocol)
    func loadPokedexPage()
    func loadNextPage()
    func updateView(with page: PokedexPage)
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
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Pokedex"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadPokedexPage()
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
    
    func loadPokedexPage() {
        presenter?.presentPokedexPage()
    }
    
    func loadNextPage() {
        presenter?.presentNextPokedexPage()
    }
    
    func updateView(with page: PokedexPage) {
        DispatchQueue.main.async {
            self.homeView.updateView(with: page)
        }
    }
}

// MARK: HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    
    func willDisplayLastCell() {
        loadNextPage()
    }
}

// MARK: HomePresenterDelegate 
extension HomeViewController: HomePresenterDelegate {
    
    func didLoadPokedexPage(_ page: PokedexPage) {
        updateView(with: page)
    }
}
