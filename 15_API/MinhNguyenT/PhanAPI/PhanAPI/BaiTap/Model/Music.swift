//
//  Music.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

import UIKit
 
final class Music {
    var name: String
    var price: String
    var releaseDate: String
    var thumbnailImage: String
    
    init(json: JSON) {
        guard let name = json["im:name"] as? JSON , let titlename = name["label"] as? String else {fatalError("error")}
        self.name = titlename
        guard let price = json["im:price"] as? JSON , let pricelabel = price["label"] as? String else {fatalError("error")}
        self.price = pricelabel
        guard let releaseDate = json["im:releaseDate"] as? JSON , let releaseDatelabel = releaseDate["label"] as? String else {fatalError("error")}
        self.releaseDate = releaseDatelabel
        guard let thumbnailImage = json["im:image"] as? [JSON], let firstImage = thumbnailImage.first, let thumbnailImageView = firstImage["label"] as? String else {fatalError("error")}
        self.thumbnailImage = thumbnailImageView
    }
}
