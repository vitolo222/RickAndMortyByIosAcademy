//
//  RMCharacterStatus.swift
//  Rick&Morty
//
//  Created by vitalik on 12/25/22.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
