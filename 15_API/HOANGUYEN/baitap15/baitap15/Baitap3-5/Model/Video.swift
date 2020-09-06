//
//  Video.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
import ObjectMapper

final class Video: Mappable {
    
    var nextPageToken: String?
    var items: [Items]?
    
    init?(map: Map) {
    }
    
    func mapping(map: Map) {
        nextPageToken <- map["nextPageToken"]
        items <- map["items"]
    }
}
