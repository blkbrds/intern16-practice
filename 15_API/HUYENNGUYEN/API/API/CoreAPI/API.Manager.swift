//
//  API.Manager.Swift
//  API
//
//  Created by bu on 9/7/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

struct APIManager {
    
    struct YoutubePath {
        static let key = "AIzaSyAkDjyk5I3xMtJsIvNhggM_oPb0RKMn4eA"
        static let baseURL = "https://www.googleapis.com/youtube"
        static let version = "/v3"
        static let path = "/search"
    }
//    static let youtubeAP÷ΩI = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=lactroi&type=video&key=AIzaSyDiK772JRmiEBN8zrqO0ZQSRGDIuwmyO1Y"
    //MARK: - Config
    
    struct Path {
//        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json
        static let baseDomain = "https://itunes.apple.com"
        static let basePath = "/us/rss"
        
        static let audioPath = "/topaudiobooks"
        static let audioHot = "/limit=10/json"
        
//https://www.googleapis.com/youtube/v3/search?part=snippet&q=lactroi&type=video&key=
//AIzaSyDiK772JRmiEBN8zrqO0ZQSRGDIuwmyO1Y
        
    }
    
    //MARK: - Domain
    struct Image { }
    
    struct Downloader { }
    
    struct Youtube { }
}
