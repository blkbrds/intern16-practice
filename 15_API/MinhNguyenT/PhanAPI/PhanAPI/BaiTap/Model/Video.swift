//
//  Video.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

final class Video: Mappable {
        
    var nextPage: String?
    var videos: [VideoItem]?
    
    init?(map: Map) {
    }
    
    func mapping(map: Map) {
        nextPage <- map["nextPageToken"]
        videos <- map["videos"]
    }
    /*
    init(json: JSON) {
    guard let name = json["snippet"] as? JSON , let titlename = name["title"] as? String else {fatalError("error")}
    self.title = titlename
    guard let channelId = json["snippet"] as? JSON , let channelIdLabel = channelId["channelId"] as? String else {fatalError("error")}
        self.channnelId = channelIdLabel
    guard let publishedAt = json["snippet"] as? JSON , let publishedAtlabel = publishedAt["publishedAt"] as? String else {fatalError("error")}
        self.publishedAt = publishedAtlabel
    guard let thumbnailImage = json["snippet"] as? JSON, let thumbnail = thumbnailImage["thumbnails"] as? JSON,let thumbnailDefault = thumbnail["default"] as? JSON, let thumbnailImageView = thumbnailDefault["url"] as? String else {fatalError("error")}
        self.thumbnails = thumbnailImageView
    }
 */
}
