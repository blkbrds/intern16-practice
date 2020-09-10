//
//  NextPageYoutube.swift
//  BaiTap_api
//
//  Created by Abcd on 8/25/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit
import ObjectMapper
class NextPageYoutube: Mappable {
    
    //MARK: - Properties
    var nextPageToken: String?
    var videosYoutube: [VideosYouTube]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        nextPageToken <- map["nextPageToken"]
        videosYoutube <- map["videosYoutube"]
    }
    

}
