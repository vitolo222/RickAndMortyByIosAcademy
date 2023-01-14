//
//  RMCharacterInfoCollectionViewCell.swift
//  Rick&Morty
//
//  Created by vitalik on 1/7/23.
//

import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
    
    private let type: `Type`
    private let value: String
    
    static let dateFormatter: DateFormatter = {
        // format
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    
    static let ShortDateFormatter: DateFormatter = {
        // format
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter
    }()
    
    
   
    
    public var title: String {
        self.type.displayTitle
    }
    
    
    public var displayValue: String {
        if value .isEmpty {return "none"}
        
      
        
        if  let date = Self.dateFormatter.date(from: value),
            type == .created {
         
            return Self.ShortDateFormatter.string(from: date)
        }
        
       return value
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor {
        return  type.tintColor
    }
    
    
    enum `Type`: String {
        case status
        case gender
       case type
       case species
       case origin
       case location
       case created
        case episodeCount
        
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemBlue
            case .gender:
                return .systemRed
            case .type:
                return .systemPurple
            case .species:
                return .systemGreen
            case .origin:
                return .systemOrange
            case .location:
                return .systemPink
            case .created:
                return .systemYellow
            case .episodeCount:
                return .systemMint
            }
        }
        
        
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "bell")
            case .type:
                return UIImage(systemName: "bell")
            case .species:
                return UIImage(systemName: "bell")
            case .origin:
                return UIImage(systemName: "bell")
            case .location:
                return UIImage(systemName: "bell")
            case .created:
                return UIImage(systemName: "bell")
            case .episodeCount:
                return UIImage(systemName: "bell")
            }
        }
        
        var displayTitle: String {
            switch self {
            case .status,
                    .gender,
                    .type,
                    .species,
                    .origin,
                    .location,
                    .created:
                return rawValue.uppercased()
            case .episodeCount:
                return "Episode count "
                
            }
        }
        
    }
    
    init(
        type: `Type`,
        value: String
         
    ) {
        self.value = value
        self.type = type
    }
}
