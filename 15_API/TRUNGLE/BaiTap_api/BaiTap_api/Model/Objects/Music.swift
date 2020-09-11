//
//  Music.swift
//  BaiTap_api
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
final class Music {
    
    //MARK: - Property
    var image: String
    var name: String
    var price: String
    var artist: String
    
    //MARK: - Initialization
    init(json: JSON) {
        guard let images = json["im:image"] as? [JSON], let firstImage = images.first, let newImage = firstImage["label"] as? String else { fatalError("can't get imgae") }
        image = newImage
        
        guard let nameLabel = json["im:name"] as? JSON, let newName = nameLabel["label"] as? String else { fatalError("can't get name") }
        name = newName
        
        guard let priceLabel = json["im:price"] as? JSON, let newPrice = priceLabel["label"] as? String else { fatalError("can't get price") }
        price = newPrice
        
        guard let artistLabel = json["im:artist"] as? JSON, let newArtist = artistLabel["label"] as? String else  { fatalError("can't get artist") }
        artist = newArtist
    }
}
