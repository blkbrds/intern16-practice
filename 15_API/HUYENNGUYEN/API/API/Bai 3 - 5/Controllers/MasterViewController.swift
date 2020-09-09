//
//  MasterViewController.swift
//  API
//
//  Created by bu on 9/8/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private lazy var searchController = UISearchController(searchResultsController: nil)
    var viewModel = MasterViewModel()
    var isLoading: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationItem.searchController = searchController
        configTableView()
        loadAPI()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "YoutubeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "YoutubeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadAPI() {
        isLoading = true
        viewModel.loadAPI { (done, message) in
            if done {
                self.tableView.reloadData()
            } else {
                print("API ERROR: \(message)")
            }
            self.isLoading = false
        }
    }
}

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
        let reload_distance:CGFloat = 10.0
        if y > (h + reload_distance), viewModel.nextPage != "", !isLoading {
            loadAPI()
        }
    }
}
