//
//  API.Video.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/25/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import ObjectMapper

extension APIManager.Video {
    
    struct QueryString {
        func getUrl() -> String {
            return APIManager.PathVideo.base_domain +
                APIManager.PathVideo.base_path +
                APIManager.PathVideo.search +
                APIManager.PathVideo.key
        }
    }
    
    struct QueryParam {
    }
    
    struct VideoResult {
        var items: [Item]
        var nextPageToken: String
    }
    
    static func getAllVideo(completion: @escaping APICompletion<VideoResult>) {
        let urlString = QueryString().getUrl()
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                guard let video = Mapper<Video>().map(JSONObject: data)
                    else {
                        completion(.failure(.error("Data is not format")))
                        return
                }
                let nextPageToken = video.nextPageToken ?? ""
                let items = video.items ?? [Item]()
                let videoResult = VideoResult(items: items, nextPageToken: nextPageToken)
                completion(.success(videoResult))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
