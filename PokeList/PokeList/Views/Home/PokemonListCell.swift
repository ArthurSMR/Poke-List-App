//
//  PokemonListCell.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import UIKit

final class PokemonListCell: UITableViewCell {
    
    static let identifier: String = String(describing: PokemonListCell.self)
    
    private let pokemonIcon: PokemonIcon = PokemonIcon()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setup(pokemonName: String, imageURL: URL? = nil) {
        label.text = pokemonName
        
        pokemonIcon.setupImage(with: imageURL)
    }
    
    private func setupView() {
        
        stackView.addArrangedSubview(pokemonIcon)
        stackView.addArrangedSubview(label)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            pokemonIcon.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16)
        ])
        
        label.textColor = .black
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
}
