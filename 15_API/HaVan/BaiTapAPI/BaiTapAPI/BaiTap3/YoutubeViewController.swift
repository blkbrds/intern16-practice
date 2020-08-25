//
//  YoutubeViewController.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/24/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class YoutubeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propeties
    var viewModel = YoutubeViewModel()
    var pageToken = ""
    var stringKey = ""

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        configTableView()
        loadData(withString: stringKey, withNextPage: pageToken)
    }

    // MARK: - Private functions
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "YoutubeCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "YoutubeCell")
    }
    
    private func loadData(withString key: String, withNextPage nextPage: String) {
        viewModel.loadAPI(withString: key, nextPage: nextPage) { (done, nextPage, error) in
            if done {
                self.pageToken = nextPage
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    self.createAlert(with: error)
                }
            }
        }
    }
    
    private func createAlert(with error: String) {
        let alert = UIAlertController(title: "You can't view the videos", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func couldLoadMore() -> Bool {
        guard tableView.contentSize.height > 0 else { return false }
        let collectionHeight = tableView.bounds.size.height
        let distanceToBottom = tableView.contentSize.height - tableView.contentOffset.y
        return distanceToBottom <= collectionHeight
    }
}

// MARK: - UITableViewDataSource
extension YoutubeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeCell", for: indexPath) as? YoutubeCell else { fatalError() }
        cell.viewModel = viewModel.cellForRowAt(atIndexPath: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension YoutubeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if couldLoadMore() && scrollView.contentOffset.y > 0 {
            loadData(withString: stringKey, withNextPage: pageToken)
        }
    }
}

// MARK: - UISearchBarDelegate
extension YoutubeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        stringKey = searchText
        viewModel.videos = []
        loadData(withString: stringKey, withNextPage: pageToken)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { searchBar.text = ""
            return }
        stringKey = text
        viewModel.videos = []
        loadData(withString: stringKey, withNextPage: pageToken)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
