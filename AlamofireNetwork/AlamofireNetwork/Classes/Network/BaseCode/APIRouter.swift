//
//  APIRouter.swift
//  AlamofireNetwork
//
//  Created by Le Abid on 11/05/2018.
//  Copyright © 2018 Qorre. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getTopArticals(country: String, apiKey: String)
    case getContent(languageCode: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getTopArticals, .getContent:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getTopArticals:
            return URLProvider.getTopArticlesUri
        case .getContent:
            return URLProvider.getContentsUri
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getTopArticals(let country, let apiKey):
            return [RequestParameters.country: country, RequestParameters.apiKey: apiKey]
        case .getContent(let language):
            return ["language": language]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let baseUrl = try URLProvider.baseUrl.asURL()
        let pathUrl = baseUrl.appendingPathComponent(path)
        var urlRequest = URLRequest(url: pathUrl)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: parameters)
    }
}
