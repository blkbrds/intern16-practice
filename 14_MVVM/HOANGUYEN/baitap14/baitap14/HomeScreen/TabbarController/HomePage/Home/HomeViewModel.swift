//
//  HomeTableViewCellViewModel.swift
//  baitap14
//
//  Created by NXH on 8/14/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
import MVVM
import MapKit

final class HomeViewModel: ViewModel {
    
    // MARK: - Singleton
    static var viewModel: HomeViewModel = HomeViewModel()
    // MARK: - Properties
    var listCoffeeShop: [CoffeeShop] =
        [CoffeeShop(image: "coffee1", name: "LALA Coffee", address: "Đường 2/9", rating: "8/10", distance: 3.2, favorites: false, description: "Ở Đà Nẵng mà muốn đổi gió, tránh xa món trà sữa béo ngậy thì hãy đến ngay Boulevard Galeto & coffee để thưởng thức hơn 20 vị kem thơm ngon. Nằm ở góc ngã 4 khá dễ tìm với vẻ ngoài trang nhã, quán cà phê đẹp Đà Nẵng này cũng thu hút nhiều du khách đến đây thư giãn vào mỗi tối mát mẻ.",coordinate: CLLocationCoordinate2D(latitude: 16.079647, longitude: 108.221438), comment: ["Quan cf nay xin so qua", "Quan 5 aubsdkasbdlasnfa  bas nalskfn;asflm  abslfkamsf;n l lkasnd nsaidn kansdkn asd*", "Se ung ho"]),
         CoffeeShop(image: "coffee2", name: "LiLi Coffee", address: "Đường Phan Thanh", rating: "9/10", distance: 0.0, favorites: false, description: "Danang Souvenirs & Coffee là loại hình cà phê kết hợp hay ho, và độc lạ so với các quán cà phê đẹp Đà Nẵng, khi bạn có thể vừa nhâm nhi thức uống ngon tuyệt vừa có thể mua quà về cho người thân, bạn bè khi đi du lịch Đà Nẵng.", coordinate: CLLocationCoordinate2D(latitude: 16.079647, longitude: 100.221438), comment: ["Quan 5*Quan 5*Quan 5*", ":))))"]),
         CoffeeShop(image: "coffee3", name: "HiHi Coffee", address: "Đường Ngũ Hành Sơn", rating: "6/10", distance: 0.3, favorites: false, description: nil, coordinate: CLLocationCoordinate2D(latitude: 17.079647, longitude: 110.221438), comment: nil),
         CoffeeShop(image: "coffee4", name: "HeHe Coffee", address: "Đường Lê Duẩn", rating: "8/10", distance: 0.5, favorites: false, description: "Khoong co mo ta", coordinate: CLLocationCoordinate2D(latitude: 16.079647, longitude: 108.221438), comment: ["asdashf", "a","asd","234","rwasf","ujaksd"]),
         CoffeeShop(image: "coffee5", name: "HoHo Coffee", address: "Đường Tăng", rating: "8/10", distance: 0.1, favorites: false, description: "Khong co mo ta", coordinate: CLLocationCoordinate2D(latitude: 17.079647, longitude: 108.221438), comment: ["asdashf", "a","asd","234","rwasf","ujaksd", "uauauauauauauauaa", "000"]),
         CoffeeShop(image: "coffee6", name: "HiuHiu Coffee", address: "Đường Tank", rating: "10/10", distance: 3.3, favorites: false, description: "Là một khu phức hợp nhỏ tại Đà Nẵng, vừa phục vụ cà phê vừa có nhiều shop quần áo trong khu vực, cho bạn tha hồ dạo chơi mua sắm mà không thiếu chỗ nghỉ ngơi. Wonderlust Danang còn là không gian mở với mái vòm kính trong suốt, có tông màu trắng làm chủ đạo tạo nên bầu không khí hiện đại, trẻ trung cho khu phức hợp nhộn nhịp.", coordinate: CLLocationCoordinate2D(latitude: 16.579647, longitude: 108.221438), comment: ["ok"]),
         CoffeeShop(image: "coffee7", name: "Helo Coffee", address: "Đường Đường", rating: "1/10", distance: 0.9, favorites: false, description: "khong co mo ta", coordinate: CLLocationCoordinate2D(latitude: 16.079647, longitude: 108.221438), comment: ["HOP LY LAM LUON A", "CF askdnijijijijada teajdaj oajd;asdoji0239uoi j923", "DEP TIEM DI", "QUAN GI MA XAU QUA", "dong quan di la duoc roi"])]
}
var homeCellViewModel: HomeCellViewModel?

extension HomeViewModel {
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return listCoffeeShop.count
    }
    
    func getHomeCell(atIndexPath indexPath: IndexPath) -> HomeCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < listCoffeeShop.count else {
            return nil
        }
        homeCellViewModel = HomeCellViewModel(coffeeShop: listCoffeeShop[indexPath.row])
        return HomeCellViewModel(coffeeShop: listCoffeeShop[indexPath.row])
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
                    return true
                } else {
                    listCoffeeShop[index].favorties = false
                    return false
                }
            }
        }
        return nil
    }
    
    func getDetailCoffeeShop(atIndexPath indexPath: IndexPath) -> DetailsViewModel {
        return DetailsViewModel(coffeeShop: listCoffeeShop[indexPath.row], index: indexPath.row)
    }
}
