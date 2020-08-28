//
//  Item.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/28/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import ObjectMapper

final class Item: Mappable {
    
    // MARK: - Properties
    var thumbnail: String?
    var title: String?
    var channel: String?
    var publishedAt: String?
    
    // MARK: - Initialize
    init?(map: Map) {
    }
    
    func mapping(map: Map) {
        thumbnail <- map["snippet.thumbnails.default.url"]
        title <- map["snippet.title"]
        channel <- map["snippet.channelTitle"]
        publishedAt <- map["snippet.publishedAt"]
    }
}
