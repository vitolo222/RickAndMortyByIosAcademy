//
//  RMEndPoint.swift
//  Rick&Morty
//
//  Created by vitalik on 12/24/22.
//

import Foundation

/// Represend APi endpoints
@frozen enum Endpoint: String {
    
    /// Endpoint to get character info
    case character
/// Endpoint to get location info
    case location
    ///Endpoint to get episode info
    case episode
    
}
