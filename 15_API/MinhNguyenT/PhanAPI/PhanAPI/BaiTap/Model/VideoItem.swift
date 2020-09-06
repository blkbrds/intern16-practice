//
//  VideoItem.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/31/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

final class VideoItem: Mappable {
    
    var publishedAt: String?
    var channnelId: String?
    var title: String?
    var thumbnails: String?
    
    init?(map: Map) {
    }
    
    func mapping(map: Map) {
        publishedAt <- map["snippet.publishedAt"]
        channnelId <- map["snippet.channelTitle"]
        title <- map["snippet.title"]
        thumbnails <- map["snippet.thumbnails.default.url"]
        
    }
}
