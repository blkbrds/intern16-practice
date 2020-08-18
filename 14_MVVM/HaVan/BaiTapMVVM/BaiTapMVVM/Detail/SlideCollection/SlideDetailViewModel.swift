//
//  SlideDetailViewModek.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/18/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

final class SlideDetailViewModel {
    private(set) var imageList: [UIImage]
    
    init(imageList: [UIImage]) {
        self.imageList = imageList
    }
    
    func getImageCell(atIndexPath indexPath: IndexPath) -> SlideCellViewModel? {
        return SlideCellViewModel(image: imageList[indexPath.row])
    }
    
    func numberOfItemsInSection() -> Int {
        return imageList.count
    }
}

extension HomeViewModel {
    
    func getSlideDetail(atIndexPath indexPath: IndexPath) -> SlideDetailViewModel? {
        guard 0 <= indexPath.row && indexPath.row <= HomeViewModel.shared.listCoffee.count else { return nil }
        let imageList: [UIImage] = Array(HomeViewModel.shared.listCoffee[indexPath.row].image.keys)
        return SlideDetailViewModel(imageList: imageList)
    }
}

