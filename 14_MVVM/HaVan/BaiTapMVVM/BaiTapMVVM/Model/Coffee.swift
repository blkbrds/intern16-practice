//
//  Coffee.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

final class Coffee {
    var name: String
    var address: String
    var rate: Int
    var favorite: Bool
    var distance: Float
    var thumbnail: UIImage
    
    init(name: String, address: String, rate: Int, favorite: Bool, thumbnail: UIImage, distance: Float) {
        self.name = name
        self.address = address
        self.rate = rate
        self.favorite = favorite
        self.distance = distance
        self.thumbnail = thumbnail
        
    }
}
