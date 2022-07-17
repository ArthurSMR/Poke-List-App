//
//  PokemonDetailsView.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 17/07/22.
//

import UIKit

final class PokemonDetailsView: UIView {
    
    var pokemon: PokemonEntity?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailViewCell.self,
                           forCellReuseIdentifier: DetailViewCell.identifier)
        tableView.register(IconViewCell.self,
                           forCellReuseIdentifier: IconViewCell.identifier)
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
    
    func updateView(pokemon: PokemonEntity) {
        self.pokemon = pokemon
        tableView.reloadData()
    }
}

extension PokemonDetailsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? 200 : 40
    }
}

extension PokemonDetailsView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon?.stats.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: IconViewCell.identifier, for: indexPath) as? IconViewCell {
                cell.setupImage(with: pokemon?.sprites.frontDefaultAsURL)
                return cell
            }
            
        } else if let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewCell.identifier, for: indexPath) as? DetailViewCell {
            
            let statName = pokemon?.stats[indexPath.row].stat.name
            let statResult = String(pokemon?.stats[indexPath.row].base_stat ?? 0)
            
            cell.setup(detailName: statName,
                       detailResult: statResult)
            return cell
        }
        
        return UITableViewCell()
    }
}

extension PokemonDetailsView: ViewCodable {
    func setupHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func render() {
        
    }
}

