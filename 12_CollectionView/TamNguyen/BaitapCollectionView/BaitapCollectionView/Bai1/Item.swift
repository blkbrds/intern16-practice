//
//  Item.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/4/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class Item {
    
    // MARK: - Properties
    var name: String
    
    // MARK: - Initial
    init(name: String = "") {
        self.name = name
    }
}

// MARK: - Extension
extension Item {
    
    static func getDummyDatas() -> [Item] {
        var items: [Item] = []
        
        for i in 0 ... 30 {
            let item = Item(name: "\(i)")
            items.append(item)
        }
        return items
    }
}
