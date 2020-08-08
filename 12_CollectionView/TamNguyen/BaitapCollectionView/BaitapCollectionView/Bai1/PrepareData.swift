//
//  PrepareData.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/4/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class PrepareData {
    
    // MARK: - Properties
    let items: [Item] = Item.getDummyDatas()
    
    // MARK: - Fuctions
    func numberOfRowInSection(in section: Int) -> Int {
        return items.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeCellModel {
        let item = items[indexPath.row]
        let viewModel = HomeCellModel(data: item)
        return viewModel
    }
}
