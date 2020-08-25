//
//  API.Video.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/25/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

extension APIManager.Video {
    
    struct QueryString {
        func allVideo(completion: @escaping APICompletion<VideoResult>) -> String {
            return APIManager.PathVideo.base_domain +
                APIManager.PathVideo.base_path +
                APIManager.PathVideo.search +
                APIManager.PathVideo.key
        }
    }
    
    struct QueryParam {
    }
    
    struct VideoResult {
        var videos: [Video]
        var preciousPage: String
        var nextPage: String
    }
    
    static func getAllVideo(completion: @escaping APICompletion<VideoResult>) {
        let urlString = QueryString().allVideo(completion: completion)
        

    }
}
