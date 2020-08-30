//
//  DataManager.swift
//  MVVM
//
//  Created by bu on 8/25/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

class DataManager {
    
    var id: Int
    var title: String
    var image: String
    var address: String
    var rate: String
    var distance: Int
    var isFavorite: Bool
    
    init(id: Int = 0, title: String = "", image: String = "", address: String = "", rate: String = "", distance: Int = 0, isFavorite: Bool = false) {
        self.id = id
        self.title = title
        self.image = image
        self.address = address
        self.rate = rate
        self.distance = distance
        self.isFavorite = isFavorite
    }
}
