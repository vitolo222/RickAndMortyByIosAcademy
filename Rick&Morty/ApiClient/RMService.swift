//
//  RMService.swift
//  Rick&Morty
//
//  Created by vitalik on 12/24/22.
//

import Foundation


/// primary api service object to get RICK and MORTY data
final class RMService {
    /// Shared singleton  instance
    static let share = RMService()
    
    
    /// Privatized consructor
    private init() {}
    
    
    /// Send Rick&Morty API Call
    /// - Parameters:
    ///   - RMRequest: Request instance
    ///   - complection: Callback with data or error
    public func ecexute(_ RMRequest: Void, complection: @escaping () -> Void) {
        
    }
}
