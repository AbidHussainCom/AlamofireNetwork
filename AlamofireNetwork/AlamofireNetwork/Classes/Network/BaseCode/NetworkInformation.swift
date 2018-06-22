//
//  NetworkInformation.swift
//  AlamofireNetwork
//
//  Created by Le Abid on 11/05/2018.
//  Copyright © 2018 Qorre. All rights reserved.
//

import Foundation

private struct UrlProviderConstants {
    
    static let baseUrl: String = "https://newsapi.org/v2"
    static let liveBaseUrl: String = ""
    
    static let topArticlesUri: String = "/top-headlines"
    static let contentsUri: String = "/contents"
}

public struct URLProvider {
    static var baseUrl: String = UrlProviderConstants.baseUrl
    static var getTopArticlesUri: String = UrlProviderConstants.topArticlesUri
    static var getContentsUri: String  = UrlProviderConstants.contentsUri
}

public struct RequestParameters {
    static let country = "country"
    static let apiKey  = "apiKey"
}

