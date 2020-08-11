//
//  Baitap1110ViewController.swift
//  baitap11
//
//  Created by NXH on 7/30/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit
import Foundation
import Contacts

final class Baitap1110ViewController: UIViewController {
 
    // MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - properties
    var contacts: [FetchedContact] = []
    var newContacts: [FetchedContact] = []
    var filterContacts: [[FetchedContact]] = []
    var matrixContacts: [[FetchedContact]] = []
    var sectionCharacter: Set<Character> = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        fetchContacts()
        transContacts()
    }
    
    // MARK: - private func
    private func configUI() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func transContacts() {
        newContacts = contacts.sorted { $0.firstName < $1.firstName }
        for contact in newContacts {
            sectionCharacter.insert(contact.firstName.first ?? " ")
        }
        for character in sectionCharacter {
            var temp: [FetchedContact] = []
            for contact in newContacts {
                if contact.firstName.first == character {
                    temp.append(contact)
                }
            }
            matrixContacts.append(temp)
        }
        filterContacts = matrixContacts
    }
    
    private func fetchContacts() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            if granted {
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        self.contacts.append(FetchedContact(firstName: contact.givenName, lastName: contact.familyName, telephone: contact.phoneNumbers.first?.value.stringValue ?? ""))
                    })
                } catch let error {
                    print("Failed to enumerate contact", error)
                }
            } else {
                print("access denied")
            }
        }
    }
    
    private func search(keyword: String) {
        filterContacts = getListName(keyword: keyword)
        sectionCharacter = []
        for index in 0..<filterContacts.count {
            sectionCharacter.insert(filterContacts[index].first?.firstName.first ?? " ")
        }
        tableView.reloadData()
    }
    
    private func getListName(keyword: String) -> [[FetchedContact]] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return matrixContacts
        } else {
            var datas: [[FetchedContact]] = []
            var data: [FetchedContact] = []
            for names in matrixContacts {
                for value in names {
                    if let _ = value.firstName.range(of: keyword) {
                        data.append(value)
                    }
                }
            }
            datas.append(data)
            return datas
        }
    }
}

// MARK: extension
extension Baitap1110ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterContacts[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filterContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filterContacts[indexPath.section][indexPath.row].firstName + " " + filterContacts[indexPath.section][indexPath.row].lastName
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        view.endEditing(true)
        let viewControler: UIViewController = UIViewController()
        viewControler.view.backgroundColor = .white
        let phoneNumberLabel: UILabel = UILabel(frame: view.frame)
        phoneNumberLabel.textAlignment = .center
        phoneNumberLabel.textColor = .red
        phoneNumberLabel.text = filterContacts[indexPath.section][indexPath.row].telephone
        viewControler.view.addSubview(phoneNumberLabel)
        navigationController?.pushViewController(viewControler, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(filterContacts[section].first?.firstName.first ?? " ")
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var charactorString: [String] = []
        for value in sectionCharacter {
            charactorString.append(String(value))
        }
        return charactorString
    }
}

extension Baitap1110ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let text = searchBar.text {
            currentText = text
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let word = searchBar.text else {
            searchBar.text = ""
            search(keyword: "")
            return
        }
        search(keyword: word)
        view.endEditing(true)
    }
}
