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
    func updateView(withPokemons pokemons: [PokemonModel])
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
    
    func updateView(withPokemons pokemons: [PokemonModel]) {
        DispatchQueue.main.async {
            self.homeView.updateView(withPokemons: pokemons)
        }
    }
}

// MARK: HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    
}

// MARK: HomePresenterDelegate 
extension HomeViewController: HomePresenterDelegate {
    
    func didLoadPokemonList(pokemons: [PokemonModel]) {
        updateView(withPokemons: pokemons)
    }
}
