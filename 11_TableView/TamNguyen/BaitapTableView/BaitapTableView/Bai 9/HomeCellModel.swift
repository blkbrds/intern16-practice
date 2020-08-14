//
//  HomeCellModel.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/30/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class HomeCellModel {
    
    //MARK: - Properties
    var user: User = User()
    
    //MARK: - Initial
    init(user: User = User()) {
        self.user = user
    }
}
