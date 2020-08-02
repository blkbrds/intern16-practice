//
//  BaiTap10ViewController.swift
//  TableView
//
//  Created by MacBook Pro on 8/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import Contacts
class BaiTap10ViewController: UIViewController {
    
    @IBOutlet private weak var tabelView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var contactStore = CNContactStore()
    var myContact: [Contact] = []
    var contact: [Contact] = []
    private var searh = false
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact"
        tabelView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                //print("success")
            }
        }
        fetchContact()
        tabelView.dataSource = self
        tabelView.delegate = self
        searchBar.delegate = self
    }
    
    func fetchContact() {
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: request) { (contact, stop) in
            let lastname = contact.givenName
            let familyname = contact.familyName
            let phonenumber = contact.phoneNumbers.first?.value.stringValue
            let contactAppend = Contact(lastName: lastname, familyName: familyname, phoneNumber: phonenumber!)
            self.myContact.append(contactAppend)
        }
        tabelView.reloadData()
    }
}

extension BaiTap10ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searh {
            return contact.count
        } else {
            return myContact.count
        }
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
        contact = myContact.filter{$0.familyName.contains(searchText) || $0.lastName.contains(searchText)}
        if searchText.isEmpty {
            searh = false
        } else {
            searh = true
        }
        tabelView.reloadData()
    }
}
