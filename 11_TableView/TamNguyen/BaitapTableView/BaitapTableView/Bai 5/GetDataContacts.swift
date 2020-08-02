//
//  GetDataContacts.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/29/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class GetDataContacts {
    
 // MARK: - Properties
    var contacts: [String] = []
    
    // MARK: - Function
    func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist") else {
            return
        }
        guard let data = NSArray(contentsOf: path) else {
            return
        }
        contacts = data as! [String]
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return contacts.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> String {
        let item = contacts[indexPath.row]
        return item
    }
}
