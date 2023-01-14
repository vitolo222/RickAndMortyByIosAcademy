//
//  RMCharacterCollectionViewCellViewModel.swift
//  Rick&Morty
//
//  Created by vitalik on 12/29/22.
//

import Foundation


final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable{
   
    
    
public  let characterName: String
private let characterStatus: RMCharacterStatus
private let characterImageUrl: URL?
    
  
    
    
    
        // MARK: - Init
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
        
        
    }
    
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(complection:  @escaping (Result<Data, Error>) -> Void) {
        guard let url = characterImageUrl else {
            
            complection(.failure(URLError(.badURL)))
            return
        }
     
        RMImageLoader.shared.downloadImage( url, complection: complection)
      
    }
    
    //MARK: - Hashable
    
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }
}
