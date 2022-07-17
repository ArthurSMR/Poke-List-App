//
//  HomeView.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import UIKit

protocol HomeViewProtocol: UIView {
    func updateView(with page: PokedexPage)
}

protocol HomeViewDelegate: AnyObject {
    func willDisplayLastCell()
}

final class HomeView: UIView {
    
    // MARK: Properties
    
    weak var delegate: HomeViewDelegate?
    
    private var pokedexPage: PokedexPage = PokedexPage()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonListCell.self, forCellReuseIdentifier: PokemonListCell.identifier)
        tableView.register(LoadViewCell.self, forCellReuseIdentifier: LoadViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: HomeViewProtocol
extension HomeView: HomeViewProtocol {
    
    func updateView(with page: PokedexPage) {
        pokedexPage = page
        tableView.reloadData()
    }
}

extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == pokedexPage.pokemons.count - 1 {
            delegate?.willDisplayLastCell()
        }
    }
}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedexPage.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == pokedexPage.pokemons.count - 1 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: LoadViewCell.identifier, for: indexPath) as? LoadViewCell {
                return cell
            }
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListCell.identifier, for: indexPath) as? PokemonListCell {

            let pokemon = pokedexPage.pokemons[indexPath.row]

            cell.setup(pokemonName: pokemon.name, imageURL: pokemon.sprites.frontDefaultAsURL)

            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: ViewCodable
extension HomeView: ViewCodable {
    
    func setupHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func render() {
        backgroundColor = .pokemonYellow
        tableView.backgroundColor = .pokemonYellow
    }
}
