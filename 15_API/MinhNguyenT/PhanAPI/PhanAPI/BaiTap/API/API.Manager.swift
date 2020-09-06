//
//  API.Manager.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

typealias JSONObject = [String: Any]
typealias JSArray = [JSONObject]

//phần quản lý việc kết nối giữa CoreAPI với các thành phần khác trong ứng dụng
struct APIManager {
    
    // MARK: Config
    // https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json
    struct Path {
        static let base_domain = "https://itunes.apple.com"
        static let base_path = "/us/rss/topaudiobooks/"
        static let music_path = "limit=10/json"
    }
    
    //https://www.googleapis.com/youtube/v3/search?part=snippet&q=lactroi&type=video&key=AIzaSyABDeapf6bS0CovoIuFxVAZrg9fhjloNIY
    struct PathVideo {
        static var nextPage = ""
        static var searchKey = ""
        static let base_domain = "https://www.googleapis.com"
        static let base_path = "/youtube/v3/"
        static var music_path: String {"/search?pageToken=\(nextPage)&part=snippet&maxResults=25&order=relevance&q=\(searchKey)&key=AIzaSyABDeapf6bS0CovoIuFxVAZrg9fhjloNIY"}
    }
        
    // MARK: - Domain
    struct Music {}
    
    struct Video {}
    
    struct Downloader {}
}
