//
//  Contacts.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/28/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

struct Contacts {
    
    static var contactList: [String] = []
    
    static func loadData(){
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: ".plist")
            else { return }
        guard let contactData = NSArray(contentsOf: path) as? [String]
            else { return }
        contactList = contactData
    }
}
