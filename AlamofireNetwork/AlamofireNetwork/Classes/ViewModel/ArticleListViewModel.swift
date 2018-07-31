//
//  ArticleListViewModel.swift
//  AlamofireNetwork
//
//  Created by Le Abid on 22/06/2018.
//  Copyright © 2018 Qorre. All rights reserved.
//

import Foundation

class ArticleListViewModel {
    
    private let articalProvider: ArticleProvider
    private var articles: [Article] = []
    
    var dataLoadingStarted: (() -> Void)? = nil
    var dataLoadingEnded: (() -> Void)? = nil
    var dataLoadedSuccess: (() -> Void)? = nil
    var dataLoadedFailure: ((_ message: String) -> Void)? = nil
    
    init(_ articleProvider: ArticleProvider = ArticleService()) {
        self.articalProvider = articleProvider
    }
    
    func getTopArticles() {
        
        self.dataLoadingStarted?()
        articalProvider.getTopArticles(for: "in") { [weak self] (__articles, __error) in
            
            guard let strongSelf = self else { return }
            strongSelf.dataLoadingEnded?()
            if let allArticles = __articles {
                strongSelf.articles = allArticles
                strongSelf.dataLoadedSuccess?()
            } else if let error = __error {
                strongSelf.dataLoadedFailure?(error.localizedDescription)
            } else {
                strongSelf.dataLoadedFailure?("Unknown error occured")
            }
        }
    }
    
    var articleCount: Int {
        get {
            return articles.count
        }
    }
    
    func articleAt(index: Int) -> Article {
        return articles[index]
    }
    
}
