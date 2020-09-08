//
//  Audio.swift
//  API
//
//  Created by bu on 9/7/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class Audio {
    var imageName: String?
    
    init(json: JSON) {
        if let imageNames = json["im:image"] as? [JSON], !imageNames.isEmpty {
            imageName = imageNames[0]["label"] as? String
        }
    }
}
