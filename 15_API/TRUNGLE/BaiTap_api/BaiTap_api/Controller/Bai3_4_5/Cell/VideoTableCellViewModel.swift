//
//  VideoTableCellViewModel.swift
//  BaiTap_api
//
//  Created by Abcd on 8/25/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
import UIKit
class VideoTableCellViewModel {
    
    //MARK: - Properties
    var thumnails: UIImage
    var channelTitle: String
    var publishedAt: String
    var title: String
    
    //MARK: - Init
    init ( thumnails: String, channelTitle: String, publishedAt: String, title: String) {
        guard let urlString = URL(string: thumnails) else { fatalError("Can't get thumnails") }
        let data = try? Data(contentsOf: urlString, options: .mappedRead)
        guard let imageData = data , let image = UIImage(data: imageData) else {
            fatalError("khong cover anh tu url duoc")
        }
        self.thumnails = image
        self.channelTitle = channelTitle
        self.publishedAt = publishedAt
        self.title = title
    }
}
