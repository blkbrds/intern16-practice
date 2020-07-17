//
//  CoffeeShop.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/17/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import Foundation
import UIKit

class CoffeeShop {
    var name: String
    var image: UIImage
    var address: String
    var rating: Int
    var distance: Int
    var isLike: Bool

    init(dummyData: [String: Any]) {
        self.name = dummyData["name"] as! String
        self.image = dummyData["image"] as! UIImage
        self.address = dummyData["address"] as! String
        self.distance = dummyData["distance"] as! Int
        self.isLike = dummyData["isLike"] as! Bool
        self.rating = dummyData["rating"] as! Int
    }
}
