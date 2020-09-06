//
//  API.Video.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

extension APIManager.Video {
    struct QueryString {
        func hotVideo( completion: @escaping APICompletion<VideoResult>) -> String {
            return APIManager.PathVideo.base_domain + APIManager.PathVideo.base_path + APIManager.PathVideo.music_path
        }
    }
    struct QueryParam {}
    
    struct VideoResult {
        var videos: [VideoItem] = []
        var nextpage: String
    }
    
    static func getVideo(completion: @escaping APICompletion<VideoResult>) {
        let urlString = QueryString().hotVideo(completion: completion)
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                guard let video = Mapper<Video>().map(JSONObject: data)
                    else {
                        completion(.failure(.error("don't get value")))
                        return
                }
                let nextPage = video.nextPage ?? ""
                let videoitem = video.videos ?? [VideoItem]()
                let videoResult = VideoResult(videos: videoitem, nextpage: nextPage)
                completion(.success(videoResult))
            }
        }
    }
}

