//
//  HomeView.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import UIKit

protocol HomeViewProtocol: UIView {
    
}

protocol HomeViewDelegate: AnyObject {
    
}

final class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    private lazy var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PokeList"
        return label
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

extension HomeView: HomeViewProtocol {
    
}

extension HomeView: ViewCodable {
    
    func setupHierarchy() {
        addSubview(label)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func render() {
        backgroundColor = .white
        
        label.backgroundColor = .red
        label.textColor = .white
    }
}