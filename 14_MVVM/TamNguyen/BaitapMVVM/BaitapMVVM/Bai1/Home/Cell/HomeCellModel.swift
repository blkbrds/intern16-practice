//
//  CollectionCellModel.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/13/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class HomeCellModel {
    
    // MARK: - Properties
    var item: Item = Item()
    
    // MARK: - Initial
    init(item: Item = Item()) {
        self.item = item
    }
}
