//
//  HomeCellModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

final class HomeCellViewModel {
    
    private(set) var name: String
    private(set) var image: UIImage
    private(set) var rate: Int
    private(set) var address: String
    private(set) var distance: Float
    private(set) var favorite: Bool
    
    init(name: String, image: UIImage, rate: Int, address: String, distance: Float, favorite: Bool) {
        self.name = name
        self.image = image
        self.rate = rate
        self.address = address
        self.distance = distance
        self.favorite = favorite
    }
}
