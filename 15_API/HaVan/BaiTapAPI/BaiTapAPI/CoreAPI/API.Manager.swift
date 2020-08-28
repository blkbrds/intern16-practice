//
//  API.Manager.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/25/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

typealias APICompletion<T> = (Result<T, APIErrors>) -> Void
typealias JSONObject = [String: Any]
typealias JSArray = [JSONObject]

struct APIManager {
    
    struct PathVideo {
        static var nextPage = ""
        static var keyString = ""
        static let base_domain = "https://www.googleapis.com"
        static let base_path = "/youtube/v3"
        static var search: String {
            "/search?pageToken=\(nextPage)&part=snippet&maxResults=25&order=relevance&q=\(keyString)"
        }
        static let key = "&key=AIzaSyDxoMGIPLA4j4QVtdOuxjrsXGeOhx-RZCI"
    }
    
    struct PathAudio {
        static let base_domain = "https://itunes.apple.com"
        static let base_path = "/us/rss/topaudiobooks"
        static let base_query = "/limit=10/json"
    }
    
    struct Video {}
    
    struct Audio {}
    
    struct Downloader {}
}
