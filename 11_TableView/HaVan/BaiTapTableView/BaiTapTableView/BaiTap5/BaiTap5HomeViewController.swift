//
//  BaiTap5HomeViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/28/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap5HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propeties
    private var contacts : [String] = Contacts.contactList
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configTableView()
        configData()
        configSearchBar()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "HOME"
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configData() {
        Contacts.loadData()
        contacts = Contacts.contactList
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func searchKeyWord(keyword: String) {
        contacts = [String]()
        contacts = getContacts(keyword: keyword)
        tableView.reloadData()
    }
    
    private func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return Contacts.contactList
        } else {
            var data: [String] = []
            for contact in Contacts.contactList {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }
}

// MARK: - UITableViewDataSource
extension BaiTap5HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension BaiTap5HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.name = contacts[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - UISearchBarDelegate
extension BaiTap5HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let searchText = searchBar.text else {
            searchKeyWord(keyword: "")
            return true
        }
        let keyword = (searchText as NSString).replacingCharacters(in: range, with: text)
        searchKeyWord(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            searchBar.text?.removeAll()
            return
        }
        searchKeyWord(keyword: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text?.removeAll()
        searchKeyWord(keyword: "")
    }
}
