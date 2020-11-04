//
//  Baitap10ViewController.swift
//  Baitap11TableView
//
//  Created by MBA0245P on 11/3/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit
import Contacts

class Baitap10ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    var contactIndex: [String] = []
    var finalContacts: [[ContactStruct]] = []
    var searchResult: [[ContactStruct]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CONTACTS"
        fetchContacts()
        configTableView()
        configIndex()
        configData()
        configSearchBar()
    }

    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }

    func configIndex() {
        var indexSet: Set<Character> = []
        var indexArray: [String] = []
        for contact in contacts {
            if let firstChar = contact.givenName.first {
                indexSet.insert(firstChar)
            }
        }

        for index in indexSet {
            indexArray.append(String(index))
        }
        contactIndex = indexArray.sorted(by: { $0 < $1 })
        tableView.reloadData()
    }

    func fetchContacts() {
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if let error = error {
                print("Access errored", error)
                return
            }
            if success {
                print("Authorization Successfull")

                let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
                let request = CNContactFetchRequest(keysToFetch: key)
                try! self.contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
                    let name = contact.givenName
                    let familyName = contact.familyName
                    guard let number = contact.phoneNumbers.first?.value.stringValue else { return }

                    let contactToAppend = ContactStruct(givenName: name, familyName: familyName, phoneNumber: number)

                    self.contacts.append(contactToAppend)
                }
            }
        }
    }

    func configData() {
        var tempArray: [ContactStruct] = []
        for i in 0..<contactIndex.count {
            for contact in contacts {
                if contact.givenName.first == Character(contactIndex[i]) {
                    tempArray.append(contact)
                }
            }
            finalContacts.append(tempArray)
            tempArray = []
        }
        searchResult = finalContacts
    }

    func configSearchBar() {
        searchBar.delegate = self
    }

    func search(keyword: String) {
        searchResult = getContacts(keyword: keyword)
        tableView.reloadData()
    }

    func getContacts(keyword: String) -> [[ContactStruct]] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return finalContacts
        } else {
            var data: [ContactStruct] = []
            var finalData: [[ContactStruct]] = []
            for i in 0..<finalContacts.count {
                for contact in finalContacts[i] {
                    let string = contact.givenName + " " + contact.familyName
                    if let _ = string.range(of: keyword) {
                        data.append(contact)
                    }
                }
                finalData.append(data)
                data = []
            }
            return finalData
        }
    }
}

extension Baitap10ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchResult.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell")
        let contactToDisplay = searchResult[indexPath.section][indexPath.row]
        cell.textLabel?.text = contactToDisplay.givenName + " " + contactToDisplay.familyName
        cell.detailTextLabel?.text = contactToDisplay.phoneNumber
        return cell
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return contactIndex
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contactIndex[section]
    }
}

extension Baitap10ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text?.removeAll()
        search(keyword: "")
    }
}
