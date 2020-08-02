//
//  BaiTap10ViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap10ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
   
    // MARK: - Propeties
    private var keys: [String] = []
    private var values: [String] = []
    let managementContact = ManagementContact()
    var contacts: [String : String] = [String : String]()
    var newKeys: [String] = [String]()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configNavigationBar()
        getKey()
        configTableView()
        configSearchBar()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "CONTACTS"
    }
    
    private func configData() {
        managementContact.fetchContacts()
        contacts = managementContact.contactsDictionary
    }
    
    private func getKey() {
        keys = Array(contacts.keys)
        keys = keys.sorted { (a, b) -> Bool in
                   a < b
        }
        newKeys = keys
        values = Array(contacts.values)
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "PeopleTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "reuseContactCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    func searchKeyWord(keyword: String) {
        keys = [String]()
        keys = getContacts(keyword: keyword)
        tableView.reloadData()
    }
    
    func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return Contacts.contactList
        } else {
            var data: [String] = []
            configData()
            for contact in Array(managementContact.contactsDictionary.keys) {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }
}

// MARK: - UITableViewDataSource
extension BaiTap10ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseContactCell", for: indexPath) as! PeopleTableViewCell
        cell.updateCell(name: keys[indexPath.row], phone: values[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension BaiTap10ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - UISearchBarDelegate
extension BaiTap10ViewController: UISearchBarDelegate {
    
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
            searchBar.text = ""
            return
        }
        searchKeyWord(keyword: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchKeyWord(keyword: "")
    }
}
