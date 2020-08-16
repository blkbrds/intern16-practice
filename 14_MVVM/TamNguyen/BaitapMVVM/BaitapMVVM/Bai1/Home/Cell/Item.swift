//
//  Item.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/13/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class Item {
    
    // MARK: - Properties
    var nameCafe: String
    var address: String
    var rate: String
    var distance: String
    
    // MARK: - Initial
    init(nameCafe: String = "", address: String = "", rate: String = "", distance: String = "") {
        self.nameCafe = nameCafe
        self.address = address
        self.rate = rate
        self.distance = distance
    }
}
