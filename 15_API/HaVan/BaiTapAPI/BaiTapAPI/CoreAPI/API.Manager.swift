//
//  API.Manager.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/25/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
 
struct APIManager {
    //MARK: Config
    struct PathVideo {
        static let nextPage = ""
        static let keyString = ""
        static let base_domain = "https://www.googleapis.com"
        static let base_path = "/youtube/v3"
        static let search = "/search?pageToken=\(nextPage)&part=snippet&maxResults=25&order=relevance&q=\(keyString)"
        static let key = "&key=AIzaSyDxoMGIPLA4j4QVtdOuxjrsXGeOhx-RZCI"
    }
    
    //MARK: - Domain
    struct Video {}
    
    struct Downloader {}
}
