//
//  BaiTap05ViewController.swift
//  Table View
//
//  Created by Phan Ngọc Khánh on 8/6/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class BaiTap05ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    var contactData: [String] = []
    var originalData: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
        configSearchBar()
    }

    // MARK: - Private functions
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist"), let contactDatas = NSArray(contentsOf: path) as? [String] else { return }
        contactData = contactDatas
        originalData = contactDatas
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        title = "Contact"
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func search(keyword: String) {
        contactData = getContacts(keyword: keyword)
        tableView.reloadData()
    }
    
    private func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: "")) == "" {
            return originalData
        } else {
            var data: [String] = []
            for contact in contactData {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }
}

// MARK: - Extensions
extension BaiTap05ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(contactData[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailViewController = ContactDetailViewController()
        contactDetailViewController.contactName = contactData[indexPath.row]
        navigationController?.pushViewController(contactDetailViewController, animated: true)
    }
}

extension BaiTap05ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text?.removeAll()
        search(keyword: "")
    }
}
