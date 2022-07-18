//
//  PokemonIcon.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 17/07/22.
//

import UIKit

final class PokemonIcon: UIView {
    
    private let pokemonIcon: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 20
        img.layer.borderWidth = 1
        img.layer.borderColor = UIColor.pokemonBlue.cgColor
        img.clipsToBounds = true
        img.image = UIImage(named: "placeholder")
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pokemonIcon.layer.masksToBounds = true
        pokemonIcon.layer.cornerRadius = pokemonIcon.frame.size.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage(with url: URL? = nil) {
        
        if let url = url {
            pokemonIcon.setImage(with: url)
        }
    }
}

extension PokemonIcon: ViewCodable {
    func setupHierarchy() {
        addSubview(pokemonIcon)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            pokemonIcon.heightAnchor.constraint(equalTo: pokemonIcon.widthAnchor),
            pokemonIcon.topAnchor.constraint(equalTo: topAnchor),
            pokemonIcon.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            pokemonIcon.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
    func render() {
        
    }
    
    
}
