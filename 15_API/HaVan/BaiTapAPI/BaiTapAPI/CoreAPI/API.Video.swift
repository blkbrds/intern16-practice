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
        var nextPage: String
    }
    
    static func getAllVideo(completion: @escaping APICompletion<VideoResult>) {
        let urlString = QueryString().allVideo(completion: completion)
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                if let data = data {
                    let json = data.toJSON()
                    guard let items = json["items"] as? [JSON] else { fatalError("can't cast items") }
                    var videos: [Video] = []
                    for video in items {
                        let newVideo = Video(json: video)
                        videos.append(newVideo)
                    }
                    let  nextPageToken = json["nextPageToken"] as? String ?? ""
                    let videoResult = VideoResult(videos: videos, nextPage: nextPageToken)
                    completion(.success(videoResult))
                } else {
                    completion(.failure(.error("Data is not format")))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
