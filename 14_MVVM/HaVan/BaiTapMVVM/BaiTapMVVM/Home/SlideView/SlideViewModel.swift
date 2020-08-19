//
//  SlideViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/19/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

final class SlideViewModel {
    
    // MARK: - Properties
    var listImage: [UIImage] = [#imageLiteral(resourceName: "slide3"), #imageLiteral(resourceName: "slide4"), #imageLiteral(resourceName: "slide1"), #imageLiteral(resourceName: "slide5"), #imageLiteral(resourceName: "slide2")]
    
    // MARK: - Public functions
    func numberOfImageSlideItem() -> Int {
        return listImage.count
    }
    
    func getSlideCellViewModel(atIndexPath indexPath: IndexPath) -> SlideCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < listImage.count else { return nil }
        return SlideCellViewModel(image: listImage[indexPath.row])
    }
}
