//
//  API.VideoYoutube.swift
//  BaiTap_api
//
//  Created by Abcd on 8/24/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
import ObjectMapper
extension APIManager.Video {
    struct QueryString {
        func getURL() ->String {
            let str = APIManager.PathYoutube.base_domain + APIManager.PathYoutube.base_path + APIManager.PathYoutube.searchLink + APIManager.PathYoutube.key
            print(str)
            return str
        }
    }
    struct VideoResults {
        var videosYoutube: [VideosYouTube]
        var nextPageToken: String
    }
    
    static func getAllVideo(completion: @escaping APICompletion<VideoResults>) {
        let urlString = QueryString().getURL()
        API.shared().requestURLString(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                guard let video = Mapper<NextPageYoutube>().map(JSONObject: data)
                    else {
                        completion(.failure(.error("Data is not format")))
                        return
                }
                let nextPageToken = video.nextPageToken ?? ""
                let videosYouTube = video.videosYoutube ?? [VideosYouTube]()
                let videoResult = VideoResults(videosYoutube: videosYouTube, nextPageToken: nextPageToken)
                completion(.success(videoResult))
            case .fail(let error):
                completion(.failure(error))
            }
        }
    }
}
