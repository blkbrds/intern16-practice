//
//  Video.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/24/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

final class Video {
    var thumbnail: String
    var title: String
    var channel: String
    var publishedAt: String
    
    init(json: JSON) {
        if let snippet = json["snippet"] as? JSON {
            guard let bunchOfThumbnail = snippet["thumbnails"] as? JSON, let defaultThumbnail = bunchOfThumbnail["default"] as? JSON, let thumbnail = defaultThumbnail["url"] as? String else { fatalError("can't get thumbnail") }
                   self.thumbnail = thumbnail
            guard let title = snippet["title"] as? String else {
                       fatalError("can't get title") }
                   self.title = title
            guard let channel = snippet["channelTitle"] as? String else { fatalError("can't get channel") }
            self.channel = channel
            guard let publishedAt = snippet["publishedAt"] as? String else { fatalError("can't get publishedAt") }
            self.publishedAt = publishedAt
        } else {
            self.thumbnail = ""
            self.title = "default title"
            self.channel = "default channel"
            self.publishedAt = "default publishAt"
        }
    }
}
