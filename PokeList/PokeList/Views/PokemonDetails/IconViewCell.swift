//
//  IconViewCell.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 17/07/22.
//

import UIKit

final class IconViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: IconViewCell.self)
    
    private let pokemonIcon: PokemonIcon = PokemonIcon()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .pokemonBlue
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(pokemonName: String, with url: URL? = nil) {
        pokemonNameLabel.text = pokemonName
        pokemonIcon.setupImage(with: url)
    }
    
    private func setupView() {
        
        addSubview(pokemonIcon)
        addSubview(pokemonNameLabel)
        
        pokemonIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pokemonIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonIcon.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonIcon.bottomAnchor, constant: 8),
            pokemonNameLabel.heightAnchor.constraint(equalToConstant: 32),
            pokemonNameLabel.centerXAnchor.constraint(equalTo: pokemonIcon.centerXAnchor),
            pokemonNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        contentView.backgroundColor = .white
    }
}
