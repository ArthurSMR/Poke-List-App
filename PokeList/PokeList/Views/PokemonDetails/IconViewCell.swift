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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage(with url: URL? = nil) {
        pokemonIcon.setupImage(with: url)
    }
    
    private func setupView() {
        
        addSubview(pokemonIcon)
        
        pokemonIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pokemonIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            pokemonIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        ])
        
        contentView.backgroundColor = .white
    }
}
