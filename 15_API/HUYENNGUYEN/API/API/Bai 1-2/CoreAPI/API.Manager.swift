//
//  API.Manager.Swift
//  API
//
//  Created by bu on 9/7/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

struct APIManager {
    
    //MARK: - Config
    struct Path {
//        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json
        static let base_domain = "https://itunes.apple.com"
        static let base_path = "/us/rss"
        
        static let audio_path = "/topaudiobooks"
        static let audio_hot = "/limit=10/json"
    }
    
    //MARK: - Domain
    struct Image {
    }
    
    struct Downloader {
    }
}
