//
//  HomeCellViewModel.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit
class HomeCellViewModel {
    
    private(set) var titlename: String
    private(set) var price: String
    private(set) var imImage: UIImage
    private(set) var releaseDate: String
    
    init(titlename: String, price: String, imImage: String, releaseDate: String) {
        self.titlename = titlename
        self.price = price
        self.releaseDate = releaseDate
        guard let imageURL = URL(string: imImage) else {fatalError("can't cover from image to url")}
        let data = try? Data(contentsOf: imageURL, options: .alwaysMapped)
        guard let newData = data, let newImage = UIImage(data: newData) else { fatalError("can't show imgage") }
        self.imImage = newImage
    }
}
