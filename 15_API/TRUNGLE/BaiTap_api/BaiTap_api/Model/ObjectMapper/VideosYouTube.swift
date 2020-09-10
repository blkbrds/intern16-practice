//
//  VideosYouTube.swift
//  BaiTap_api
//
//  Created by Abcd on 8/25/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit
import ObjectMapper

class VideosYouTube: Mappable {
    var thumnails: String?
    var channelTitle: String?
    var publishedAt: String?
    var title: String?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        thumnails <- map["snippet.title"]
        channelTitle <- map["snippet.channelTitle"]
        publishedAt <- map ["snippet.publishedAt"]
        title <- map ["snippet.title"]
    }
    

}
