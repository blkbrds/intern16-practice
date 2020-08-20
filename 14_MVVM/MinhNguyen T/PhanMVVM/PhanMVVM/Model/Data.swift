//
//  Data.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/13/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

struct Data {
    let titleName: String
    let imageName: String
    let address: String
    let rating: Int
    let distance: Int
    let description: String
    var isLike: Bool
    var avartar: String
    var nameuser: String
    let dayago: String
    var comment: [String]
    
    init(titleName: String, imageName: String, address: String, rating: Int, distance: Int, description: String, isLike: Bool, avartar: String, nameuser: String, dayago: String, comment: [String]) {
        self.titleName = titleName
        self.imageName = imageName
        self.address = address
        self.rating = rating
        self.distance = distance
        self.isLike = isLike
        self.description = description
        self.avartar = avartar
        self.nameuser = nameuser
        self.dayago = dayago
        self.comment = comment
    }
}

struct Images {
    
    let imagename: String
    
    init(imagename: String) {
        self.imagename = imagename
    }
}
