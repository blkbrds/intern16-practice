//
//  UserContact.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/31/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class UserContact {
    
    //MARK: - Properties
    var avatarUser: String
    var nameUser: String
    var numberUser: String
    
    //MARK: - Init
    init(avatarUser: String = "", nameUser:String = "", numberUser: String = "") {
        self.avatarUser = avatarUser
        self.nameUser = nameUser
        self.numberUser = numberUser
    }
}
