//
//  AudioBookCellViewModel.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

final class AudioBookCellViewModel {
    // MARK: - Properties
    private(set) var title: String
    private(set) var price: String
    private(set) var releaseDate: String
    private(set) var image: UIImage
    
    // MARK: - Initialize
    init(title: String, price: String, releaseDate: String, image: String) {
        self.title = title
        self.price = price
        self.releaseDate = releaseDate
        guard let imageURL = URL(string: image) else {fatalError("can't cover from image to url")}
        let data = try? Data(contentsOf: imageURL, options: .alwaysMapped)
        guard let newData = data, let newImage = UIImage(data: newData) else { fatalError("can't show imgage") }
        self.image = newImage
    }
}
