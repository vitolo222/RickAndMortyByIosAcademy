//
//  RMGetCharactersResponse.swift
//  Rick&Morty
//
//  Created by vitalik on 12/27/22.
//

import Foundation


struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    
    let info: Info
    let results: [RMCharacter]
}




