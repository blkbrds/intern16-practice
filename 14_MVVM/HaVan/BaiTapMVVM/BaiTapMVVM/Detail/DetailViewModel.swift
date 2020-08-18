//
//  DetailViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/17/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import MapKit

final class DetailViewModel {
    private(set) var nameCoffee: String
    private(set) var imageDetail: [String]
    private(set) var location: CLLocationCoordinate2D
    private(set) var favorite: Bool
    private(set) var position: Int
    
    init(nameCoffee: String, imageDetail: [String], location: CLLocationCoordinate2D, favorite: Bool, position: Int) {
        self.nameCoffee = nameCoffee
        self.imageDetail = imageDetail
        self.location = location
        self.favorite = favorite
        self.position = position
    }
    
    func numberOfImgage() -> Int {
        return imageDetail.count
    }
    
    func chaneState(fav: Bool){
        HomeViewModel.shared.listCoffee[position].favorite = fav
    }
}

extension HomeViewModel {
    
    func getDetailModel(atIndexPath indexPath: IndexPath) -> DetailViewModel? {
        guard 0 <= indexPath.row && indexPath.row < HomeViewModel.shared.listCoffee.count else { return nil }
        let description = Array(HomeViewModel.shared.listCoffee[indexPath.row].image.values)
        return DetailViewModel(nameCoffee: HomeViewModel.shared.listCoffee[indexPath.row].name, imageDetail: description, location: HomeViewModel.shared.listCoffee[indexPath.row].location, favorite: HomeViewModel.shared.listCoffee[indexPath.row].favorite, position: indexPath.row)
    }
}
