//
//  YoutubeTableViewCellViewModel.swift
//  API
//  Created by bu on 9/9/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

final class YoutubeTableViewCellViewModel {
    
    //MARK: -  Properties
    var youtube: Youtube
    var titleVideo: String? {
        return youtube.titleVideo
    }
    var chanelTitle: String? {
        return youtube.chanelTitle
    }
    var publishedAt: String? {
        return youtube.publishedAt
    }
    var thumbnailImageName: String? {
        return youtube.thumbnailImage
    }
    
    //MARK: - Initialization
    init(youtube: Youtube) {
        self.youtube = youtube
    }
}
