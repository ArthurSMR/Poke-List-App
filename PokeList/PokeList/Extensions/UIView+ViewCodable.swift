//
//  UIView+ViewCodable.swift
//  PokeList
//
//  Created by Arthur Rodrigues on 15/07/22.
//

import UIKit

public protocol ViewCodable {

    /// Use to setup delegates, tap gestures, and images
    func configure()

    /// Use to add my UIComponents inside the view
    func setupHierarchy()

    /// Setup constraints to the view and the subviews
    func setupConstraints()

    /// Customize the UIComponents (fonts, colors...)
    func render()

    /// Setup any accessibility to the view
    func setupAccessibilityIdentifiers()

    /// This method buidls the view using all the other methods from the protocol
    func setupView()
}

public extension ViewCodable {

    func setupView() {
        configure()
        setupHierarchy()
        setupConstraints()
        render()
        setupAccessibilityIdentifiers()
    }

    func configure() { }

    func setupAccessibilityIdentifiers() { }
}

