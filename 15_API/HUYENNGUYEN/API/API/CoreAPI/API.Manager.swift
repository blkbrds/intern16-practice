//
//  API.Manager.Swift
//  API
//
//  Created by bu on 9/7/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

struct APIManager {
    
    // MARK: - Config
    struct YoutubePath {
        static let key = "AIzaSyAkDjyk5I3xMtJsIvNhggM_oPb0RKMn4eA"
        static let baseURL = "https://www.googleapis.com/youtube"
        static let version = "/v3"
        static let path = "/search"
    }
    
    struct Path {
        static let baseDomain = "https://itunes.apple.com"
        static let basePath = "/us/rss"
        
        static let audioPath = "/topaudiobooks"
        static let audioHot = "/limit=10/json"
    }
    
    //MARK: - Domain
    struct Image { }
    
    struct Downloader { }
    
    struct Youtube { }
}
