//
//  HomeTableViewCellViewModel.swift
//  baitap14
//
//  Created by NXH on 8/14/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
import MVVM

final class HomeCellViewModel: ViewModel {
    
    var listCoffeeShop: [CoffeeShop] = [CoffeeShop(image: "coffee1", name: "LALA Coffee", address: "Đường 2/9", rating: "8/10", distance: 3.2, favorites: false), CoffeeShop(image: "coffee2", name: "LiLi Coffee", address: "Đường Phan Thanh", rating: "9/10", distance: 0.0, favorites: false), CoffeeShop(image: "coffee3", name: "HiHi Coffee", address: "Đường Ngũ Hành Sơn", rating: "6/10", distance: 0.3, favorites: false), CoffeeShop(image: "coffee4", name: "HeHe Coffee", address: "Đường Lê Duẩn", rating: "8/10", distance: 0.5, favorites: false), CoffeeShop(image: "coffee5", name: "HoHo Coffee", address: "Đường Tăng", rating: "8/10", distance: 0.1, favorites: false), CoffeeShop(image: "coffee6", name: "HiuHiu Coffee", address: "Đường Tank", rating: "10/10", distance: 3.3, favorites: false), CoffeeShop(image: "coffee7", name: "Helo Coffee", address: "Đường Đường", rating: "1/10", distance: 0.9, favorites: false)]
}
    var model: HomeTableViewCellModel?

extension HomeCellViewModel {
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return listCoffeeShop.count
    }
    
    func getHomeTableViewCell(atIndexPath indexPath: IndexPath) -> HomeTableViewCellModel? {
        guard 0 <= indexPath.row && indexPath.row < listCoffeeShop.count else {
            return nil
        }
        model = HomeTableViewCellModel(coffeeShop: listCoffeeShop[indexPath.row])
        return HomeTableViewCellModel(coffeeShop: listCoffeeShop[indexPath.row])
    }
    
    func settupFavoritesButton(text: String) -> Bool {
        for value in listCoffeeShop {
            if value.name == text {
                return value.favorties
            }
        }
        return false
    }
    func getFavorites(text: String) -> Bool? {
        for (index, value) in listCoffeeShop.enumerated() {
            if value.name == text {
                if !value.favorties {
                    listCoffeeShop[index].favorties = true
                      print(listCoffeeShop)
                    return true
                } else {
                    listCoffeeShop[index].favorties = false
                      print(listCoffeeShop)
                    return false
                }
            }
        }
        return nil
    }
}
