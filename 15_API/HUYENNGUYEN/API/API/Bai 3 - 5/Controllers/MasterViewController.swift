//
//  MasterViewController.swift
//  API
//
//  Created by bu on 9/8/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class MasterViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Properties
    private lazy var searchController = UISearchController(searchResultsController: nil)
    private var viewModel = MasterViewModel()
    private var isLoading: Bool = false
    private let refreshControl = UIRefreshControl()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationItem.searchController = searchController
        configTableView()
        loadAPI(isRefresh: false)
        configRefeshControl()
    }
    
    //MARK: - Function
    private func configTableView() {
        let nib = UINib(nibName: "YoutubeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "YoutubeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configRefeshControl() {
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    private func loadAPI(isRefresh: Bool) {
        isLoading = true
        viewModel.loadAPI(isRefresh: isRefresh) { (done, message) in
            if done {
                self.tableView.reloadData()
            } else {
                print("API ERROR: \(message)")
            }
            self.isLoading = false
            self.refreshControl.endRefreshing()
        }
    }
    
    //MARK: - Objc
    @objc private func updateData() {
        viewModel.nextPage = nil
        loadAPI(isRefresh: true)
    }
}

//MARK: - Extension UITableViewDataSource
extension MasterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.youtubes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeTableViewCell", for: indexPath) as? YoutubeTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let bounds = scrollView.bounds
        let size = scrollView.contentSize
        let inset = scrollView.contentInset
        let y = offset.y + bounds.size.height - inset.bottom
        let h = size.height
        let reload_distance: CGFloat = 10.0
        if y > (h + reload_distance), viewModel.nextPage != "", !isLoading {
            loadAPI(isRefresh: false)
        }
    }
}
