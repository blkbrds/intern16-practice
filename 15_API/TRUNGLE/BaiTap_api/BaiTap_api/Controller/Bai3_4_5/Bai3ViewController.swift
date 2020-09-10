//
//  Bai3ViewController.swift
//  BaiTap_api
//
//  Created by Abcd on 8/24/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel = Bai3ViewModel()
    var nextPageToken = ""
    var searchKey = ""
    var stringKey = ""
    let refreshTable = UIRefreshControl()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        setupSearchBar()
        loadAPI(pageToken: nextPageToken, searchKey: searchKey)
        configfresherTable()
    }
    
    //MARK: - Function
    func configTableView() {
        let nib = UINib(nibName: "VideoTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        searchBar.resignFirstResponder()
    }
    
    func loadAPI(pageToken: String, searchKey: String) {
        viewModel.loadAPI(nextPageToken: pageToken, searchKey: searchKey) { (done, error, token) in
            if done {
                self.nextPageToken = token
                self.tableView.reloadData()
            } else {
                print("ko load duoc api: \(error)")
            }
        }
    }
    
    func configfresherTable() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshTable
        } else {
            tableView.addSubview(refreshTable)
        }
        refreshTable.tintColor = #colorLiteral(red: 0.5441568514, green: 1, blue: 0.2874319265, alpha: 1)
        refreshTable.attributedTitle = NSAttributedString(string: "Please Waiting", attributes: .none)
        refreshTable.addTarget(self, action: #selector(refreshVideoData(_:)), for: .valueChanged)
    }
    
    @objc func refreshVideoData(_ sender: Any) {
        searchBar.text?.removeAll()
        stringKey = ""
        nextPageToken = ""
        loadAPI(pageToken: nextPageToken, searchKey: stringKey)
        refreshTable.endRefreshing()
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.stopAnimating()
    }
    func loadMore() -> Bool {
        guard tableView.contentSize.height > 0 else { return false }
        let tableHeight = tableView.contentSize.height
        let spacingOfBottom = tableView.contentSize.height - tableView.contentOffset.y
        return spacingOfBottom <= tableHeight
    }
}

//MARK: - Extension
extension Bai3ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VideoTableViewCell
        cell.viewModel = viewModel.cellForRowAtIndexPath(atIndexPath: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if loadMore() && scrollView.contentOffset.y > 0 {
            loadAPI(pageToken: nextPageToken, searchKey: stringKey)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension Bai3ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        stringKey = searchText
        viewModel.videosYouTube = []
        loadAPI(pageToken: nextPageToken, searchKey: stringKey)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { searchBar.text = ""
            return }
        stringKey = text
        viewModel.videosYouTube = []
        loadAPI(pageToken: nextPageToken, searchKey: stringKey)
        searchBar.resignFirstResponder()
    }
}
