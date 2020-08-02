//
//  User.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/30/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class User {
    
    // MARK: - Properties
    var nameUser: String
    var imageUser: String
    var subTitle: String
    
    // MARK: - Init
    init(nameUser: String = "", imageUser: String = "", subTitle: String = "") {
        self.nameUser = nameUser
        self.imageUser = imageUser
        self.subTitle = subTitle
    }
}
