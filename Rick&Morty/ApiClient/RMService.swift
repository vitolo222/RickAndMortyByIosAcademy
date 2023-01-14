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
    static let shared = RMService()
    
    
    /// Privatized consructor
    private init() {}
    
    
    enum RmServiceError: Error {
        case failedToCreateRequest
        case failedToGetdata
    }
    
    /// Send Rick&Morty API Call
    /// - Parameters:
    ///   - RMRequest: Request instance
    ///   - Type: the type of object that we expect to get back
    ///   - complection: Callback with data or error
    public func ecexute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        complection: @escaping (Result<T, Error>) -> Void
    ) {
        
        guard let urlRequest = self.request(from: request) else {
            complection(.failure(RmServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                complection(.failure(error ?? RmServiceError.failedToGetdata))
                return
            }
//     Decode responce
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                complection(.success(result))
            }
            catch {
                complection(.failure(error))
            }
        }
        task.resume()
    }
    
    
//    MARK: - Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
