//
//  HomeViewController.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Propeties
    private var viewModel = HomeViewModel()
    private var nextPageToken = ""
    private var keySearch = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadAPI(pageToken: nextPageToken, keySearch: keySearch)
        searchBar.delegate = self
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        searchBar.resignFirstResponder()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadAPI(pageToken: String, keySearch: String) {
        viewModel.loadAPI(nextpageToken: pageToken, keySearch: keySearch) { (done, error, token) in
            if done {
                self.nextPageToken = token
                self.tableView.reloadData()
            } else {
                print("err:", error)
            }
        }
    }
    
    private func couldLoadMore() -> Bool {
        guard tableView.contentSize.height > 0 else { return false }
        let collectionHeight = tableView.bounds.size.height
        let distanceToBottom = tableView.contentSize.height - tableView.contentOffset.y
        return distanceToBottom <= collectionHeight
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModel.cellForRowAtIndexPath(atIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if couldLoadMore() && scrollView.contentOffset.y > 0 {
            loadAPI(pageToken: nextPageToken, keySearch: keySearch)
        }
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let key = searchBar.text else {
            return
        }
        keySearch = key
        viewModel.items = []
        loadAPI(pageToken: nextPageToken, keySearch: keySearch)
        searchBar.resignFirstResponder()
    }
}
