//
//  Bai5ViewController.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/29/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai5ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var friendsTableView: UITableView!
    
    // MARK: - Properties
    private var searchList: [String] = []
    private let cellIdentifier: String = "cell"
    private var getDataContacts = GetDataContacts()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
    }
    
    // MARK: - Private methods
    private func loadData() {
        getDataContacts.loadData()
    }
    
    private func configTableView() {
        title = "Home"
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        friendsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        friendsTableView.tableFooterView = UIView(frame: .zero)
        searchList = getDataContacts.contacts
        searchBar.delegate = self
    }
}

// MARK: - Extension UITableViewDataSource
extension Bai5ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = getDataContacts.viewModelForCell(at: indexPath)
        return cell
    }
}

// MARK: - Extension UITableViewDelegate
extension Bai5ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - Extension UISearchBarDelegate
extension Bai5ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let upperText = searchText.uppercased()
        searchList = getDataContacts.contacts.filter { $0.uppercased().hasPrefix(upperText) }
        friendsTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList = getDataContacts.contacts
        searchBar.searchTextField.text = nil
        friendsTableView.reloadData()
    }
}

