//
//  DetailCellModel.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/17/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class DetailCellModel {
    
    // MARK: - Properties
    var item: DetailModel = DetailModel()
    
    // MARK: - Initial
    init(item: DetailModel = DetailModel()) {
        self.item = item
    }
}
