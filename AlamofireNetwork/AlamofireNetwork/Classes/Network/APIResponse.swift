//
//  APIResponse.swift
//  AlamofireNetwork
//
//  Created by Le Abid on 22/06/2018.
//  Copyright © 2018 Qorre. All rights reserved.
//

import Foundation

struct TopArticalsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
