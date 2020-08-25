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
    var offsetY = 0
    // MARK: - Initialize
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        configTableView()
        loadData(withString: "", withNextPage: pageToken)
    }
    // MARK: - Override functions
    
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
                print(error)
            }
        }
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions
}

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

extension YoutubeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == 130 * 24 {
            offsetY += 130 * 24
            loadData(withString: "", withNextPage: pageToken)
        }
    }
}

extension YoutubeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.videos = []
        pageToken = ""
        loadData(withString: searchText, withNextPage: pageToken)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { searchBar.text = ""
                   return }
               viewModel.videos = []
            pageToken = ""
               loadData(withString: text, withNextPage: pageToken)
               searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
