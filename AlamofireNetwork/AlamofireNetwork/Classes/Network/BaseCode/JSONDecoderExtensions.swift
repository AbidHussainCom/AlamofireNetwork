//
//  JSONDecoderExtensions.swift
//  AlamofireNetwork
//
//  Created by Le Abid on 22/06/2018.
//  Copyright © 2018 Abid Hussain. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static var shared: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        return decoder
    }()
}
