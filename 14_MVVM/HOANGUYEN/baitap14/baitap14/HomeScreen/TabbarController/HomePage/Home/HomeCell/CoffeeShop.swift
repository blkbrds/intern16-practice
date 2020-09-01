//
//  CoffeeShop.swift
//  baitap14
//
//  Created by NXH on 8/14/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
import MapKit

struct CoffeeShop {
    var image: String
    let name: String
    var address: String
    var rating: String
    var distance: Float
    var favorties: Bool
    var description: String?
    var coordinate: CLLocationCoordinate2D
    var comment: [String]?
    
    init(image: String, name: String, address: String, rating: String, distance: Float, favorites: Bool, description: String?, coordinate: CLLocationCoordinate2D, comment: [String]?) {
        self.image = image
        self.name = name
        self.address = address
        self.rating = rating
        self.distance = distance
        self.favorties = favorites
        self.description = description
        self.coordinate = coordinate
        self.comment = comment
    }
}
