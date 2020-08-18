//
//  Coffee.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit
import MapKit

final class Coffee {
    var name: String
    var address: String
    var rate: Int
    var favorite: Bool
    var distance: Float
    var thumbnail: UIImage
    var image: [UIImage: String]
    var comment: [String: String]
    var location: CLLocationCoordinate2D
    
    init(name: String, address: String, rate: Int, favorite: Bool, thumbnail: UIImage, distance: Float, image: [UIImage: String], comment: [String: String], location: CLLocationCoordinate2D) {
        self.name = name
        self.address = address
        self.rate = rate
        self.favorite = favorite
        self.distance = distance
        self.thumbnail = thumbnail
        self.image = image
        self.comment = comment
        self.location = location
    }
}
