//
//  MasterViewController.swift
//  AlamofireNetwork
//
//  Created by Le Abid on 22/06/2018.
//  Copyright © 2018 Qorre. All rights reserved.
//

import UIKit
import SafariServices
import SKActivityIndicatorView

class ArticleListViewController: UITableViewController {

    let viewModel = ArticleListViewModel()
    
    lazy var getTopArticlesLoader: Void = {
        viewModel.getTopArticles()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = true
        tableView.tableFooterView = UITableViewHeaderFooterView()
        
        viewModel.dataLoadingStarted = {
            SKActivityIndicator.show()
        }
        
        viewModel.dataLoadingEnded = {
            SKActivityIndicator.dismiss()
        }
        
        viewModel.dataLoadedSuccess = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.dataLoadedFailure = {[weak self] message in
            self?.showMessage(message, isSucces: false)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = getTopArticlesLoader
    }
    
    func showMessage(_ message: String, isSucces: Bool = false) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articleCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)
        (cell.contentView.viewWithTag(1) as! UILabel).text = viewModel.articleAt(index: indexPath.row).title
        (cell.contentView.viewWithTag(2) as! UILabel).text = String(describing: viewModel.articleAt(index: indexPath.row).publishedAt)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        present(SFSafariViewController(url: URL(string: viewModel.articleAt(index: indexPath.row).url)!),
                animated: true,
                completion: nil)
    }


}

