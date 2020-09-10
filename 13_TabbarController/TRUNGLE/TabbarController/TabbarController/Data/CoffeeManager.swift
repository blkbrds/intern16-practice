//
//  CoffeeManager.swift
//  TabbarController
//
//  Created by Abcd on 9/10/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
class CoffeeManager {
    
    // MARK: - Properties
    var name: String
    var image: String
    var address: String
    var distance: String
    var rate: String
    var favorite: Bool

    // MARK: - Init
    init(name: String = "", image: String = "", address: String = "", distance: String = "", rate: String = "", favorite: Bool = false) {
        self.name = name
        self.image = image
        self.address = address
        self.distance = distance
        self.rate = rate
        self.favorite = favorite
    }
}
