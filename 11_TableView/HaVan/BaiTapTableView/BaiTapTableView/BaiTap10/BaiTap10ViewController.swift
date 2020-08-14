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
    private let managementContact = ManagementContact()
    private var contactList: [String : String] = [:]
    private var newSection : [[String]] = []
    private let contact = Contact()
    private var sectionIndex: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configNavigationBar()
        getKey()
        configTableView()
        configSearchBar()
        configSectionIndex()
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        searchBar.resignFirstResponder()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "CONTACTS"
    }
    
    private func configData() {
        managementContact.fetchContacts()
        contactList = managementContact.contactsDictionary
    }
    
    private func getKey() {
        keys = []
        keys = Array(contactList.keys)
        newSection = contact.transContacts(with: keys)
    }
    
    private func configSectionIndex() {
        for char in contact.sectionIndex {
            sectionIndex.append(String(char))
        }
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
    
    private func searchKeyWord(keyword: String) {
        newSection = [[String]]()
        newSection = getContacts(keyword: keyword)
        tableView.reloadData()
    }
    
    private func getContacts(keyword: String) -> [[String]] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return contact.transContacts(with: keys)
        } else {
            var data: [String] = []
            configData()
            for contact in Array(managementContact.contactsDictionary.keys) {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            newSection.append(data)
            return newSection
        }
    }
}

// MARK: - UITableViewDataSource
extension BaiTap10ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newSection[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseContactCell", for: indexPath) as? PeopleTableViewCell else { fatalError("Can't load PeopleTableViewCell") }
        let name = newSection[indexPath.section][indexPath.row]
        guard let phone = contactList[name] else { fatalError("Can not get the phone") }
        cell.updateCell(name: name, phone: phone)
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionIndex[section]
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
            searchBar.text?.removeAll()
            return
        }
        searchKeyWord(keyword: searchText)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text?.removeAll()
        searchKeyWord(keyword: "")
        searchBar.resignFirstResponder()
    }
}
