//
//  UserInCel.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/31/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class UserInCell {
    
    // MARK: - Properties
    var user: UserContact = UserContact()
    
    // MARK: - Init
    init(user: UserContact = UserContact()) {
        self.user = user
    }
}
