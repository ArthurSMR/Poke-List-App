//
//  LoadViewCell.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 17/07/22.
//

import UIKit

final class LoadViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: LoadViewCell.self)
    
    private let loadActivity: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(loadActivity)
        
        NSLayoutConstraint.activate([
            loadActivity.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            loadActivity.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        ])
        
        loadActivity.startAnimating()
    }
}
