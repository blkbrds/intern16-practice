//
//  Bai4ViewController.swift
//  Bai3Protocol
//
//  Created by Abcd on 7/27/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class Bai4ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dataTableView: UITableView!
    // MARK: - Propeties
    private var searchName: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        title = "Home"
        dataTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        dataTableView.delegate = self
        dataTableView.dataSource = self
        searchBar.delegate = self
        searchName = DataSource.listData
    }
}

extension Bai4ViewController: UITableViewDataSource, UITableViewDelegate     {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchName[indexPath.row]
        return cell
    }
}

extension Bai4ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchName = DataSource.listData.filter({$0.prefix(searchText.count) == searchText})
        dataTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchName = DataSource.listData
        dataTableView.reloadData()
    }
}
