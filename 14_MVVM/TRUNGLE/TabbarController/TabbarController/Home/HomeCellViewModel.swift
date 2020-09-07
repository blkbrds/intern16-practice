//
//  HomeCellViewModel.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
import UIKit
final class HomeCellViewModel {
    var name: String
    var image: String
    var rate: String
    var address: String
    var distance: String
    var favorite: Bool
    
    init(name: String, image: String, rate: String, address: String, distance: String, favorite: Bool) {
        self.name = name
        self.image = image
        self.rate = rate
        self.address = address
        self.distance = distance
        self.favorite = favorite
    }
}
