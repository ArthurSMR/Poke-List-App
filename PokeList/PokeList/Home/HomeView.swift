//
//  HomeView.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import UIKit

protocol HomeViewProtocol: UIView {
    func updateView(withPokemons pokemons: [PokemonModel])
}

protocol HomeViewDelegate: AnyObject {
    
}

final class HomeView: UIView {
    
    // MARK: Properties
    
    weak var delegate: HomeViewDelegate?
    
    private var pokemons: [PokemonModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonListCell.self,
                           forCellReuseIdentifier: PokemonListCell.identifier)
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
    
    func updateView(withPokemons pokemons: [PokemonModel]) {
        self.pokemons = pokemons
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListCell.identifier, for: indexPath) as? PokemonListCell {

            let pokemon = pokemons[indexPath.row]

            cell.setup(pokemonName: pokemon.name, imageURL: pokemon.sprites.frontDefaultAsURL)

            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
