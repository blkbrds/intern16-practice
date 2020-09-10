//
//  Youtube.swift
//  API
//
//  Created by bu on 9/9/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class Youtube {
    //MARK: - Properties
    var videoID: String = ""
    var titleVideo: String?
    var chanelTitle: String?
    var publishedAt: String?
    var thumbnailImage: String?
    
    //MARK: - Initialization
    init(json: JSON) {
        if let id = json["id"] as? JSON, let videoID = id["videoID"] as? String {
            self.videoID = videoID
        }
        
        if let snippet = json["snippet"] as? JSON {
            self.titleVideo = snippet["title"] as? String
            self.chanelTitle = snippet["channelTitle"] as? String
            self.publishedAt = snippet["publishedAt"] as? String
            
            if let thumbnails = snippet["thumbnails"] as? JSON, let `default` = thumbnails["default"] as? JSON {
                self.thumbnailImage = `default`["url"] as? String
            }
        }
    }
}
