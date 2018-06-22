//
//  LanguageService.swift
//  AlamofireNetwork
//
//  Created by Abid Hussain on 22/06/2018.
//  Copyright © 2018 Abid Hussain. All rights reserved.
//

import UIKit
import Alamofire

protocol ArticleProvider {
    typealias ArticleProviderClosure =  (_ categories: [Article]?, _ error: Error?) -> Void
    func getTopArticles(for country: String, completion: @escaping ArticleProviderClosure) -> Void
}

final class ArticleService {

    private let networkProvider: NetworkFetching
    
    private lazy var jsonDecoder: JSONDecoder = {
        return JSONDecoder.shared
    }()
    
    init(_ networkProvider: NetworkFetching = APIClient()) {
        self.networkProvider = networkProvider
    }
}

extension ArticleService: ArticleProvider {
    
    public func getTopArticles(for country: String, completion: @escaping ArticleProvider.ArticleProviderClosure) {
        let topArticalRouter = APIRouter.getTopArticals(country: country, apiKey: openNewsKey)
        networkProvider.performRequest(router: topArticalRouter, decoder: jsonDecoder) { (result: Result<TopArticalsResponse>) in
            switch result {
            case .success(let newsResponse):
                completion(newsResponse.articles, nil)
                break
            case .failure(let error):
                completion(nil, error)
                break
            }
        }
    }
}
