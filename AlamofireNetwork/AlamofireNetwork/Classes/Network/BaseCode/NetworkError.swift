//
//  NetworkError.swift
//  NetworkError
//
//  Created by Le Abid on 22/06/2018.
//  Copyright © 2018 Abid Hussain. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case unknown
    case emptyData
    case noConnectivity
    
    var localizedDescription: String {
        switch self {
        case .unknown:
            return "Unknown error"
        case .emptyData:
            return "Empty Data"
        case .noConnectivity:
            return "No internet"
        }
    }
}
