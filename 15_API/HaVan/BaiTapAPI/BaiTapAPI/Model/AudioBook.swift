//
//  AudioBook.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

final class AudioBook {
    
    var title: String
    var price: String
    var releaseDate: String
    var image: String
    
    init(json: JSON) {
        guard let titleAtribute = json["title"] as? JSON, let newTitle = titleAtribute["label"] as? String else { fatalError("can't get title") }
        title = newTitle
        guard let priceAtribute = json["im:price"] as? JSON, let newPrice = priceAtribute["label"] as? String else { fatalError("can't get price") }
        price = newPrice
        guard let release = json["im:releaseDate"] as? JSON, let releaseAtributes = release["attributes"] as? JSON, let newReaseDate = releaseAtributes["label"] as? String else  { fatalError("can't get releaseDate") }
        releaseDate = newReaseDate
        guard let bunchImage = json["im:image"] as? [JSON], let firstImage = bunchImage.first, let newImage = firstImage["label"] as? String else { fatalError("can't get imgae") }
        image = newImage
    }
}
