//
//  RMEndPoint.swift
//  Rick&Morty
//
//  Created by vitalik on 12/24/22.
//

import Foundation

/// Represend APi endpoints
@frozen enum RMEndpoint: String {
    

    case character
/// Endpoint to get location info
    case location
    ///Endpoint to get episode info
    case episode
    
}
