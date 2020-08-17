//
//  Home1ViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewModel {
    
    var listCoffee: [Coffee] = [Coffee(name: "Cộng", address: "123 Nguyễn Đình Chiểu", rate: 8, favorite: false, thumbnail: #imageLiteral(resourceName: "cf6"), distance: 3.2), Coffee(name: "The Coffee House", address: "09 Triệu Nữ Vương", rate: 9, favorite: false, thumbnail: #imageLiteral(resourceName: "cf0"), distance: 5.6), Coffee(name: "Highland", address: "05 Lý Thái Tổ", rate: 8, favorite: false, thumbnail: #imageLiteral(resourceName: "cf8"), distance: 2.6), Coffee(name: "Kittie Coffee", address: "06 Nguyễn Hoàng", rate: 7, favorite: false, thumbnail: #imageLiteral(resourceName: "cf5"), distance: 3.7), Coffee(name: "Cloud", address: "182 Thái Thị Bôi", rate: 9, favorite: false , thumbnail: #imageLiteral(resourceName: "cf1"), distance: 2.7),
                                Coffee(name: "Sunny", address: "32 Lê Hồng Phong", rate: 8, favorite: false, thumbnail: #imageLiteral(resourceName: "cf8"), distance: 1.3)]
    
    func changeState(position: Int, favorite: Bool) {
        listCoffee[position].favorite = favorite
    }
    
    func numberOfRowInSection() -> Int {
        return listCoffee.count
    }
    
    func getHomeCellViewModel(atIndexPath indexPath: IndexPath) -> HomeCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < listCoffee.count else { return nil }
        return HomeCellViewModel(name: listCoffee[indexPath.row].name, image: listCoffee[indexPath.row].thumbnail, rate: listCoffee[indexPath.row].rate, address: listCoffee[indexPath.row].address, distance: listCoffee[indexPath.row].distance, favorite: listCoffee[indexPath.row].favorite)
    }
}
