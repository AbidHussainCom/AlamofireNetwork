//
//  CodableExtensions.swift
//  AlamofireNetwork
//
//  Created by Abid Hussain on 20/07/2018.
//  Copyright © 2018 Qorre. All rights reserved.
//

import Foundation

extension Encodable {
    func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

extension Data {
    func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
    
    func decodedCollection<T: Decodable>() throws -> [T] {
        return try JSONDecoder().decode([T].self, from: self)
    }
}
