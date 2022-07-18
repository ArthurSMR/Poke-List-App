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
    func didTapPokemon(_ pokemon: PokemonEntity)
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
    
    private var upButton: UpButtonView = {
       let button = UpButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func scrollToTop() {
        let topRow = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: topRow, at: .top, animated: true)
    }
    
    @objc private func upButtonDidTapped() {
        scrollToTop()
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
            upButton.isHidden = false
            delegate?.willDisplayLastCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokedexPage.pokemons[indexPath.row]
        delegate?.didTapPokemon(pokemon)
    }
}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedexPage.pokemons.count == 0 ? 1 : pokedexPage.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == pokedexPage.pokemons.count - 1 || pokedexPage.pokemons.count == 0 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: LoadViewCell.identifier, for: indexPath) as? LoadViewCell {
                cell.startAnimation()
                return cell
            }
        } else if let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListCell.identifier, for: indexPath) as? PokemonListCell {
        
            let pokemon = pokedexPage.pokemons[indexPath.row]

            cell.setup(pokemonName: pokemon.name, imageURL: pokemon.sprites.frontDefaultAsURL)

            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: ViewCodable
extension HomeView: ViewCodable {
    
    func configure() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(upButtonDidTapped))
        upButton.addGestureRecognizer(tapGesture)
    }
    
    func setupHierarchy() {
        addSubview(tableView)
        addSubview(upButton)
    }
    
    func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            upButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            upButton.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -32),
            upButton.heightAnchor.constraint(equalToConstant: 48),
            upButton.heightAnchor.constraint(equalTo: upButton.widthAnchor)
        ])
    }
    
    func render() {
        backgroundColor = .pokemonYellow
        tableView.backgroundColor = .pokemonYellow
    }
}
