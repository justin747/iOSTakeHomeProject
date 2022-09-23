//
//  Endpoint.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 9/21/22.
//

import Foundation

enum Endpoint {
    
    case people
    case detail(id: Int)
    case create
    
}


extension Endpoint {
    
    var host: String { "reqres.in" }
    
    var path: String {
        
        switch self {
        case .people,
             .create:
            return "/api/users"
        case .detail(let id):
            return "/api/users/\(id)"
       
        }
    }
}


extension Endpoint {
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme     = "https"
        urlComponents.host       = host
        urlComponents.path       = path
        urlComponents.queryItems = [
        
            URLQueryItem(name: "delay", value: "1")
            
        ]
    }
}
