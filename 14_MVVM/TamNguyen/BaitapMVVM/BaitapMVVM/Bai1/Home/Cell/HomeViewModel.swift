//
//  HomeViewModel.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/16/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class HomeViewModel {
    
    // MARK: - Properties
    private var datas: [Item] = []
    
    // MARK: - Function
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberRowInSection(in section: Int) -> Int {
        return datas.count
    }
    
    func viewModelForCell(at indexpath: IndexPath) -> HomeCellModel {
        let item = datas[indexpath.row]
        let viewModel = HomeCellModel(item: item)
        return viewModel
    }
    
    func getData() {
        var cafes: [Item] = []
        cafes.append(Item(nameCafe: "Cong Cafe", address: "45 Ngo Quyen", rate: "6/10", distance: "3km"))
        cafes.append(Item(nameCafe: "Hate Cafe", address: "45 Mac Dinh Chi", rate: "6/10", distance: "3km"))
        cafes.append(Item(nameCafe: "Yeu Cafe Cafe", address: "45 Le Loi", rate: "6/10", distance: "3km"))
        cafes.append(Item(nameCafe: "Cat Cafe", address: "45 Ngo Quyen", rate: "6/10", distance: "3km"))
        cafes.append(Item(nameCafe: "Cong Cafe", address: "45 Ngo Quyen", rate: "6/10", distance: "3km"))
        datas = cafes
    }
    
    func getNameCafe(at indexpath: IndexPath) -> String {
        let item = datas[indexpath.row]
        let nameCafe = item.nameCafe
        return nameCafe
    }
}
