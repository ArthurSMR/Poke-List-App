//
//  UpButtonView.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 18/07/22.
//

import UIKit

final class UpButtonView: UIView {
    
    private lazy var upButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pokemon_up_arrow"), for: .normal)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = frame.size.height / 2
    }
    
    func setupView() {
        
        addSubview(upButton)
        
        NSLayoutConstraint.activate([
            
            upButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            upButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            upButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            upButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        backgroundColor = .white
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.pokemonBlue.cgColor
    }
}
