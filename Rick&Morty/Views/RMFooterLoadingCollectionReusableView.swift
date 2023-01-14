//
//  RMFooterLoadingCollectionReusableView.swift
//  Rick&Morty
//
//  Created by vitalik on 1/1/23.
//

import UIKit

class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
        static let indentifier = "RMFooterLoadingCollectionReusableView"
    
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(spinner)
        addConstrains() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstrains() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    public func startAnimating() {
        spinner.startAnimating()
    }
}
