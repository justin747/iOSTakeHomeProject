//
//  StaticJSONMapper.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 8/21/22.
//

import Foundation

struct StaticJSONMapper {
    
    static func decode <T: Decodable> (file:String, type: T.Type) throws -> T {
        
        guard let path = Bundle.main.path(forResource: file, ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingEror.failedToGetContents
        }
        
        let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
    }
}

extension StaticJSONMapper {
    enum MappingEror : Error {
        case failedToGetContents
    }
}
