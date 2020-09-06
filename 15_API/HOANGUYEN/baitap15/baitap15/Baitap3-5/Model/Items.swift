//
//  Items.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
import ObjectMapper

final class Items: Mappable {
    
    var title: String?
    var publishedAt: String?
    var thumbnailsURL: String?
    var channelTitle: String?
    
    init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["snippet.title"]
        publishedAt <- map["snippet.publishedAt"]
        thumbnailsURL <- map["snippet.thumbnails.default.url"]
        channelTitle <- map["snippet.channelTitle"]
    }
}
