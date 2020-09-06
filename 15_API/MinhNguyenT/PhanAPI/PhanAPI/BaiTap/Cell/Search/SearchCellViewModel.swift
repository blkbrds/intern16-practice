//
//  SearchCellViewModel.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class SearchCellViewModel {
    private(set) var titlename: String
    private(set) var channel: String
    private(set) var imImage: UIImage
    private(set) var publlish: String
    
    init(titlename: String, channel: String, imImage: String, publlish: String) {
        self.titlename = titlename
        self.channel = channel
        self.publlish = publlish
        guard let imageURL = URL(string: imImage) else {fatalError("can't cover from image to url")}
        let data = try? Data(contentsOf: imageURL, options: .alwaysMapped)
        guard let newData = data, let newImage = UIImage(data: newData) else { fatalError("can't show imgage") }
        self.imImage = newImage
    }
}
