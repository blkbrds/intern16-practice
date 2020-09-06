//
//  CellModel.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
import UIKit

final class CellViewModel {
    
    private(set) var thumbnail: UIImage
    private(set) var title: String
    private(set) var channelTitle: String
    private(set) var publishedAt: String
    
    init(title: String, thumbnail: String, channel: String, publishedAt: String) {
        self.title = title
        guard let urlString = URL(string: thumbnail) else { fatalError("can’t get url string image") }
        let data = try? Data(contentsOf: urlString, options: .mappedRead)
        guard let newData = data, let image = UIImage(data: newData) else { fatalError("can’t cover from urlString to data of image") }
        self.thumbnail = image
        self.channelTitle = channel
        self.publishedAt = publishedAt
    }
}
