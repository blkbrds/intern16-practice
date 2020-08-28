//
//  Video.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/24/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import ObjectMapper

final class Video : Mappable {
    
    // MARK: - Properties
    var nextPageToken: String?
    var items: [Item]?
    
    // MARK: - Initialize
    init?(map: Map) {
    }
    
    func mapping(map: Map) {
        nextPageToken <- map["nextPageToken"]
        items <- map["items"]
    }
}
