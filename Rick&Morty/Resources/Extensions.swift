//
//  Extensions.swift
//  Rick&Morty
//
//  Created by vitalik on 12/28/22.
//

import UIKit


extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
        addSubview($0)
        })
    }
}
