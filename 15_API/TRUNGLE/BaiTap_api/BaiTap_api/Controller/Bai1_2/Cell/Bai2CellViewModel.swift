//
//  Bai2CellViewModel.swift
//  BaiTap_api
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
import UIKit
class Bai2CellViewModel {
    
    //MARK: - Properties
    var artist: String
    var image : UIImage
    var name: String
    var price: String
   
    //MARK: - Init
    init (artist: String, image: String, name: String, price: String ) {
        self.artist = artist
        self.name = name
        self.price = price
        guard let urlImage = URL(string: image) else {fatalError("can't cover from image to url")}
        let data = try? Data(contentsOf: urlImage, options: .alwaysMapped)
        guard let newData = data, let newImage = UIImage(data: newData) else { fatalError("can't show imgage") }
        self.image = newImage
    }
}
