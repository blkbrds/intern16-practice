//
//  SearchViewController.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Peroperties
    var searchController = UISearchController(searchResultsController: nil)
    var viewModel = SearchViewModel()
    var tableRowNumber : Int = 10
    var searchKey: String = ""
    var nextPage: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigNavi()
        configTable()
        searchController.searchBar.delegate = self
        loadDataAPI(searchKey: searchKey, nextPage: nextPage)
    }
    
    // MARK: - Private functions
    private func cofigNavi() {
        navigationItem.searchController = searchController
        navigationItem.title = "Search"
        let reloadButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(loadAPI))
        navigationItem.rightBarButtonItem = reloadButton
    }
    
    private func configTable() {
        let nib = UINib(nibName: "SearchTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "SearchTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadDataAPI(searchKey: String, nextPage: String){
        viewModel.loadAPI(searchKey: searchKey, nextPage: nextPage) { (done, error, nextPage) in
            if done {
                self.nextPage = nextPage
                self.tableView.reloadData()
            } else  {
                let alert = UIAlertController(title: "Error!!!!!!!", message: error, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Objc functions
    @objc private func loadAPI(){
        viewModel.loadAPI(searchKey: searchKey, nextPage: nextPage) { (done, error, nextPage) in
            if done {
                self.nextPage = nextPage
                self.tableView.reloadData()
            } else  {
                let alert = UIAlertController(title: "Error!!!!!!!", message: error, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {return UITableViewCell()}
        cell.viewModel = viewModel.cellForRowAt(atIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
        {
            tableRowNumber += 10
            loadDataAPI(searchKey: searchKey, nextPage: nextPage)
        }
    }
}
    
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchKey = searchText
        viewModel.videos = []
        loadDataAPI(searchKey: searchKey, nextPage: nextPage)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { searchBar.text = ""
            return }
        searchKey = text
        viewModel.videos = []
        loadDataAPI(searchKey: searchKey, nextPage: nextPage)
    }
}
