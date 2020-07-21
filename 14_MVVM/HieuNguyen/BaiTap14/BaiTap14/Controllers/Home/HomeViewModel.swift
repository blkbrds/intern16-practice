//
//  HomeViewModel.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/17/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewModel {

    private(set) var coffeeShops: [CoffeeShop] = []
    
    func getData() {
        for item in dummyData {
            let coffeeShop = CoffeeShop(dummyData: item)
            coffeeShops.append(coffeeShop)
        }
    }
    
    func viewModelForItem(indexPath: IndexPath) -> HomeCellViewModel? {
        guard indexPath.row < coffeeShops.count else { return nil }
        let coffeeShop = coffeeShops[indexPath.row]
        return HomeCellViewModel(coffeeShop: coffeeShop)
    }
    
    func removeCell(indexPath: IndexPath) {
        coffeeShops.remove(at: indexPath.row)
    }
    
    func insertCell(indexPath: IndexPath) {
        let dummyCell: [String: Any] =
        ["name": "Highland Coffee 1","image": UIImage(named: "1")!,"address": "1 Lê Lợi","rating":8,"distance": 3,"isLike": true]
        coffeeShops.insert(CoffeeShop(dummyData: dummyCell), at: indexPath.row + 1)
    }
    
    func detailViewModelForItem(indexPath: IndexPath) -> HomeDetailViewModel? {
        guard indexPath.row < coffeeShops.count else { return nil }
        let coffeeShop = coffeeShops[indexPath.row]
        return HomeDetailViewModel(coffeeShop: coffeeShop)
    }
    
    func changeLike(at index: Int, isLike: Bool, completion: () -> Void) {
        guard index < coffeeShops.count else { return }
        coffeeShops[index].isLike = isLike
        completion()
    }
}

// dummy data
let dummyData: [[String: Any]] = [
    ["name": "Highland Coffee 1","image": UIImage(named: "1")!,"address": "1 Lê Lợi","rating":8,"distance": 3,"isLike": true],
    ["name": "Cộng coffee","image": UIImage(named: "2")!,"address": "3 Quang Trung","rating":9,"distance": 3,"isLike": false],
    ["name": "StarBuck","image": UIImage(named: "3")!,"address": "12 Lê Duẩn","rating":8,"distance": 3,"isLike": true],
    ["name": "Coffee House","image": UIImage(named: "4")!,"address": "133 Trần Phú","rating":10,"distance": 3,"isLike": false],
    ["name": "Highland Coffee ","image": UIImage(named: "5")!,"address": "12 Hoàng Hoa Thám","rating":9,"distance": 3,"isLike": true],
    ["name": "Alar cart","image": UIImage(named: "6")!,"address": "1 Lê Lợi","rating":7,"distance": 3,"isLike": true],
    ["name": "Highland Coffee 1","image": UIImage(named: "7")!,"address": "1 Lê Lợi","rating":6,"distance": 3,"isLike": true],
    ["name": "Highland Coffee 1","image": UIImage(named: "8")!,"address": "1 Lê Lợi","rating":5,"distance": 3,"isLike": true],
    ["name": "Highland Coffee 1","image": UIImage(named: "9")!,"address": "1 Lê Lợi","rating":8,"distance": 3,"isLike": true],
    ["name": "Highland Coffee 1","image": UIImage(named: "10")!,"address": "1 Lê Lợi","rating":8,"distance": 3,"isLike": true]
]
