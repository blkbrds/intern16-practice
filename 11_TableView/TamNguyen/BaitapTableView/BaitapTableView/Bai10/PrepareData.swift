//
//  PrepareData.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/31/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class PrepareData {
    
    // MAK: - Properties
    var users: [[UserContact]] = []
    
    // MARK: - Functions
    
    func numberOfSection() -> Int {
        return users.count
    }
    
    func numberOfRowInSection(in section: Int) -> Int {
        return users[section].count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> UserInCell {
        let item = users[indexPath.section][indexPath.row]
               let viewModel = UserInCell(user: item)
               return viewModel
    }
    
    func getUser() {
        var users: [[UserContact]] = []
        guard let path = Bundle.main.url(forResource: "Contact", withExtension: "plist") else {
            return
        }
        guard let data = NSArray(contentsOf: path) as? [[[String]]] else {
            return
        }
        for index1 in 0 ..< data.count {
            var userNames = [UserContact]()
            for index2 in 0 ..< data[index1].count {
                let user = UserContact(avatarUser: "download", nameUser: data[index1][index2][0], numberUser: data[index1][index2][1])
                userNames.append(user)
            }
            users.append(userNames)
        }
        self.users = users
    }
}
