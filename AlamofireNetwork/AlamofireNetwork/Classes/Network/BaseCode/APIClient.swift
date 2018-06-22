//
//  APIClient.swift
//  AlamofireNetwork
//
//  Created by Le Abid on 11/05/2018.
//  Copyright © 2018 Qorre. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkFetching {
    @discardableResult func performRequest<T:Decodable>(router:APIRouter, decoder: JSONDecoder, completion:@escaping (Result<T>)->Void) -> DataRequest
}

extension NetworkFetching {
    @discardableResult
    func performRequest<T>(router: APIRouter, decoder: JSONDecoder, completion: @escaping (Result<T>) -> Void) -> DataRequest where T : Decodable {
        return Alamofire.request(router)
            .responseJSONDecodable (decoder: decoder){ (response: DataResponse<T>) in
                completion(response.result)
        }
    }
}


class APIClient: NetworkFetching { }
