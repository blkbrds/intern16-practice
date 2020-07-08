//
//  People.swift
//  BaiTapView
//
//  Created by NganHa on 6/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

final class People {
    var nameImage: String
    var name: String
    
    init(img image: String, _ name: String) {
        self.nameImage = image
        self.name = name
    }
}
