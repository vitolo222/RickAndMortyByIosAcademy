//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  Rick&Morty
//
//  Created by vitalik on 1/7/23.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    private let imageUrl: URL?
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    
    public func fetchImage(complection: @escaping (Result<Data, Error>) -> Void) {
        guard let imageUrl = imageUrl else {
            complection(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imageUrl, complection: complection)
    }
}
