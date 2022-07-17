//
//  PokemonListCell.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 16/07/22.
//

import UIKit

final class PokemonListCell: UITableViewCell {
    
    static let identifier: String = String(describing: PokemonListCell.self)
    
    private let pokemonImageView: UIImageView = {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pokemonImageView.layer.masksToBounds = true
        pokemonImageView.layer.cornerRadius = pokemonImageView.frame.size.height / 2
    }
    
    func setup(pokemonName: String, imageURL: URL? = nil) {
        label.text = pokemonName
        
        if let imageURL = imageURL {
            pokemonImageView.setImage(with: imageURL)
        }
    }
    
    private func setupView() {
        
        stackView.addArrangedSubview(pokemonImageView)
        stackView.addArrangedSubview(label)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            pokemonImageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9),
            pokemonImageView.heightAnchor.constraint(equalTo: pokemonImageView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16)
        ])
        
        label.textColor = .black
    }
}
