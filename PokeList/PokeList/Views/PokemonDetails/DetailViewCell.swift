//
//  DetailViewCell.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 17/07/22.
//

import UIKit

final class DetailViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: DetailViewCell.self)
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private let detailNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private let detailResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .pokemonBlue
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        detailResultLabel.layer.masksToBounds = true
        detailResultLabel.layer.cornerRadius = detailResultLabel.frame.size.height / 2
    }
    
    func setup(detailName: String?, detailResult: String?) {
        detailNameLabel.text = detailName?.capitalizingFirstLetter()
        detailResultLabel.text = detailResult
    }
    
    private func setupView() {
        
        stackView.addArrangedSubview(detailNameLabel)
        stackView.addArrangedSubview(detailResultLabel)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            detailResultLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.1),
            detailResultLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.8)
        ])
        
        selectionStyle = .none
        
        contentView.backgroundColor = .white
        
        detailResultLabel.font = .boldSystemFont(ofSize: 16)
    }
}
