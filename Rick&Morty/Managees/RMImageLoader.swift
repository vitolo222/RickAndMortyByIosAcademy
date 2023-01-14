//
//  ImageLoader.swift
//  Rick&Morty
//
//  Created by vitalik on 1/3/23.
//

import Foundation

final class RMImageLoader {
    static let shared = RMImageLoader()
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private init() {}
    
    /// get iamge content with url
    /// - Parameters:
    ///   - url: Source url
    ///   - complection: CallBack
   public func downloadImage(_ url: URL, complection: @escaping(Result<Data, Error>) -> Void) {
       
       let key = url.absoluteString as NSString
       if let data = imageDataCache.object(forKey: key) {
           complection(.success(data as Data))
           return
       }
       
       
        let request = URLRequest(url: url)
       let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
           guard let data = data, error == nil else {
               complection(.failure(error ?? URLError(.badServerResponse)))
               return
           }
           
           
           let key = url.absoluteString as NSString
           let value = data as NSData
           self?.imageDataCache.setObject(value, forKey: key)
           complection(.success(data))
       }
       task.resume()
    }
}
