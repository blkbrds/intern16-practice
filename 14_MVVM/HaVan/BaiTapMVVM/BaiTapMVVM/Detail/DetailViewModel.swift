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
    private(set) var description: String
    private(set) var location: CLLocationCoordinate2D
    private(set) var favorite: Bool
    private(set) var position: Int
    
    init(nameCoffee: String, description: String, location: CLLocationCoordinate2D, favorite: Bool, position: Int) {
        self.nameCoffee = nameCoffee
        self.description = description
        self.location = location
        self.favorite = favorite
        self.position = position
    }

    func chaneState(fav: Bool){
        HomeViewModel.shared.listCoffee[position].favorite = fav
    }
}

extension HomeViewModel {
    
    func getDetailModel(atIndexPath indexPath: IndexPath) -> DetailViewModel? {
        guard 0 <= indexPath.row && indexPath.row < HomeViewModel.shared.listCoffee.count else { return nil }
        return DetailViewModel(nameCoffee: HomeViewModel.shared.listCoffee[indexPath.row].name, description: HomeViewModel.shared.listCoffee[indexPath.row].description, location: HomeViewModel.shared.listCoffee[indexPath.row].location, favorite: HomeViewModel.shared.listCoffee[indexPath.row].favorite, position: indexPath.row)
    }
}
