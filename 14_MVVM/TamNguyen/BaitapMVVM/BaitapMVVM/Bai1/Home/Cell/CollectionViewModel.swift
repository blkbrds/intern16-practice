//
//  HomeViewModel.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/13/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class CollectionViewModel {
    
    // MARK: - Properties
    private var datas: [Item] = []
    private var flag: Int = 0
    typealias  FlagCallBack = (Int) -> Void
    
    // MARK: - Function
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRowInSection(in section: Int) -> Int {
        return datas.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> CollectionCellModel {
        let item = datas[indexPath.row]
        let viewModel = CollectionCellModel(item: item)
        return viewModel
    }
    
    func getData() {
        var datas: [Item] = []
        let item2 = Item(nameCafe: "Hate Cafe", address: "23 Ton Duc Thang", rate: "6/10", distance: "2km")
        let item3 = Item(nameCafe: "Love Cafe Cafe", address: "23 Ton Duc Thang", rate: "6/10", distance: "2km")
        let item4 = Item(nameCafe: "Hate Cafe", address: "23 Ton Duc Thang", rate: "6/10", distance: "2km")
        let item5 = Item(nameCafe: "Hate Cafe", address: "23 Ton Duc Thang", rate: "6/10", distance: "2km")
        let item6 = Item(nameCafe: "Hate Cafe", address: "23 Ton Duc Thang", rate: "6/10", distance: "2km")
        datas.append(item2)
        datas.append(item3)
        datas.append(item4)
        datas.append(item5)
        datas.append(item6)
        self.datas = datas
    }
    
    func updateStatusButton(flag: Int, completion: FlagCallBack) {
        if flag == 1 {
            completion(1)
        }
        if flag == 0 {
            completion(0)
        }
    }
}
