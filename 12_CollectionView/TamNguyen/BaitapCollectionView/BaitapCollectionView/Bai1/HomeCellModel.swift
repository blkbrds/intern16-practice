//
//  HomeCellModel.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/4/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class HomeCellModel {
    
    // MARK: - Properties
    var data: Item = Item()
    
    // MARK: - Initial
    init(data: Item = Item()) {
        self.data = data
    }
}
