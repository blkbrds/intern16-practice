//
//  BaiTap10ViewController.swift
//  TableView
//
//  Created by MacBook Pro on 8/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import Contacts

final class BaiTap10ViewController: UIViewController {

    // MARK: @IBOutlets
    @IBOutlet private weak var tabelView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!

    // MARK: - Private functions
    private var contactStore = CNContactStore()
    private var myContact: [Contact] = []
    private var contact: [Contact] = []
    private var searh = false

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigTable()
        navigationItem.title = "Contact"
    }

    // MARK: - Privte functions
    private func cofigTable() {
        tabelView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contactStore.requestAccess(for: .contacts) { (success, error) in }
        fetchContact()
        tabelView.dataSource = self
        tabelView.delegate = self
        searchBar.delegate = self
    }

    private func fetchContact() {
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: request) { (contact, stop) in
            let lastname = contact.givenName
            let familyname = contact.familyName
            let phonenumber = contact.phoneNumbers.first?.value.stringValue
            let contactAppend = Contact(lastName: lastname, familyName: familyname, phoneNumber: phonenumber ?? "")
            self.myContact.append(contactAppend)
        }
        tabelView.reloadData()
    }
}

extension BaiTap10ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searh == true ? contact.count: myContact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        if searh {
            let contactDisplay = contact[indexPath.row]
            cell.textLabel?.text = contactDisplay.lastName + " "  + contactDisplay.familyName
            cell.detailTextLabel?.text = contactDisplay.phoneNumber
        } else {
            let contactDisplay = myContact[indexPath.row]
            cell.textLabel?.text = contactDisplay.lastName + " "  + contactDisplay.familyName
            cell.detailTextLabel?.text = contactDisplay.phoneNumber
        }
        return cell
    }
}

extension BaiTap10ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        contact = myContact.filter{$0.familyName.contains(searchText) || $0.lastName.contains(searchText) }
        searh = searchText.isEmpty ? false : true
        tabelView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
