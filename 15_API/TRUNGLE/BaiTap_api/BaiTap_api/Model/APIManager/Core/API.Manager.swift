//
//  API.Manager.swift
//  BaiTap_api
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
struct APIManager {
    //MARK: - Config
    struct PathBai1 {
        static let base_domain = "https://itunes.apple.com"
        static let base_path = "/us/rss"
        static let music_path = "/topaudiobooks"
        static let music_range = "/limit=10/json"
        }
    
    struct PathYoutube {
        static let base_domain: String = "https://www.googleapis.com"
        static let base_path: String = "/youtube/v3"
        static let key: String = "key=AIzaSyCI5bXi-DwDs33tlDhC9DmtfBe3NCZMJ1c"
        static var searchKey: String = ""
        static var nextPageToken: String = ""
        static var searchLink: String {
            "/search?pageToken=\(nextPageToken)&part=snippet&maxResults=25&order=relevance&q=\(searchKey)&"
        }
    }

    //MARK: - Domain
    struct Image {}
    struct Video {}
}
