//
//  API.Youtube.swift
//  API
//
//  Created by bu on 9/9/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

extension APIManager.Youtube {
    struct QueryString {
        func hotMusic(pageToken: String?, keyword: String, limit: Int) -> String {
            return APIManager.YoutubePath.baseURL +
                APIManager.YoutubePath.version +
                APIManager.YoutubePath.path +
                parameters(pageToken: pageToken, keyword: keyword, limit: limit)
        }
        
        private func parameters(pageToken: String?, keyword: String, limit: Int) -> String {
            let pathParams =  "part=snippet&q=\(keyword)&type=video&key=\(APIManager.YoutubePath.key)"
            if let pageToken = pageToken {
                return "?pageToken=\(pageToken)&" + pathParams
            }
            return "?" + pathParams
        }
    }
    
    struct QueryParam { }
    
    struct YoutubeResult {
        let youtubes: [Youtube]
        let nextPage: String
    }
    
    static func getHotYoutube(pageToken: String?, keyword: String, limit: Int = 20, completion: @escaping APICompletion<YoutubeResult>) {
        let urlString = QueryString().hotMusic(pageToken: pageToken, keyword: keyword, limit: limit)
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                if let data = data {
                    var youtubes: [Youtube] = []
                    var nextPage = ""
                    let json = data.toJSON()
                    if let items = json["items"] as? [JSON] {
                        for item in items {
                            let youtube = Youtube(json: item)
                            youtubes.append(youtube)
                        }
                    }
                    if let nextPageToken = json["nextPageToken"] as? String {
                        nextPage = nextPageToken
                    }
                    completion(.success(YoutubeResult(youtubes: youtubes, nextPage: nextPage)))
                } else {
                    completion(.failure(.error("Data is not format.")))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
