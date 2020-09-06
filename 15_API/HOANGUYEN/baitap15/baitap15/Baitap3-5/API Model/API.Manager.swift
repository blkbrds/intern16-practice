//
//  API.Manager.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

struct APIManager {
    
    struct VideoPath {
        static var keySearch: String = ""
        static var nextPageToken: String = ""
        static let domain: String = "https://www.googleapis.com"
        static let path: String = "/youtube/v3"
        static let key: String = "key=AIzaSyBzlFXs7hA7kMREnlJk9F6RdIvAlfWUkqM"
        static var search: String {
            "/search?pageToken=\(nextPageToken)&part=snippet&maxResults=25&order=relevance&q=\(keySearch)&"
        }
    }
    
    struct Video {
    }
}
