//
//  API.Video.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
import ObjectMapper

extension APIManager.Video {
    
    struct QueryString {
        
        func getURL() -> String {
            return APIManager.VideoPath.domain + APIManager.VideoPath.path + APIManager.VideoPath.search + APIManager.VideoPath.key
        }
    }
    
    struct VideoResults {
        var items: [Items]
        var nextPageToken: String
    }
    
    static func getAllVideo(completion: @escaping APICompletion<VideoResults>) {
        let url: String = QueryString().getURL()
        API.sharedAPI().request(urlString: url) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let object):
                guard let video = Mapper<Video>().map(JSONObject: object)
                  else {
                    completion(.failure(.error("Data is not format")))
                    return
                }
                let nextPageToken: String = video.nextPageToken ?? ""
                let items = video.items ?? [Items]()
                let videoResult = VideoResults(items: items, nextPageToken: nextPageToken)
                completion(.success(videoResult))
            }
        }
    }
}
