//
//  RMRequest.swift
//  Rick&Morty
//
//  Created by vitalik on 12/24/22.
//

import Foundation

/// Object that represend signle API call
final class RMRequest {
//    Base url
//    Endpoint
//    Path components
//    Query parameters
    
    /// API Constans
    private struct Constans {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired and point
   private let endpoint: RMEndpoint
    
    /// Path components for API, fi any
   private let pathComponents: [String]
    
    
    /// Constructed url for the api request  in string format
   private let queryParameners: [URLQueryItem]
    
    /// Constructed url for the api request  in string format
    private var urlstring: String {
        var string = Constans.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameners.isEmpty {
            string += "?"
            let argumentString = queryParameners.compactMap({
                guard let value = $0.value else {return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        
        return string
    }
    
    /// Computed & Constructed API url
    public var url: URL? {
        return URL(string: urlstring)
    }
    
    /// Desired http Method
    public let httpMethod = "GET"
    
    
    /// Construct Requet Target endpoint
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: collection of path components
    ///   - queryParameners: collection of query params
    public init(endpoint: RMEndpoint,
                pathComponents: [String] = [],
                queryParameners: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameners = queryParameners
        
        
    }
    
    /// Attemp to create request
    /// - Parameter url: URL to parse
    convenience init?(url: URL) {
        let string =  url.absoluteString
        if !string.contains(Constans.baseUrl) {
            return nil
        }
        
        let trimmed = string.replacingOccurrences(of: Constans.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                
                var pathComponents: [String] = []
                if components.count > 1 {
                    pathComponents = components
                    pathComponents.removeFirst()
                }
                if let rmEndpoint = RMEndpoint(
                    rawValue: endpointString
                  
                ) {
                    self.init(endpoint: rmEndpoint, pathComponents: pathComponents)
                    return
                }
                
            }
            
            
            
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemsString = components[1]
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    
                    let parts = $0.components(separatedBy: "=")
                    
                    return URLQueryItem(
                        name: parts[0],
                        value: parts[1])
                })
                if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoint:rmEndpoint, queryParameners: queryItems)
                    return
                }
            }
        }
        return nil
    }
}

extension RMRequest {
    static let listCharactersRequest = RMRequest(endpoint: .character)
}
