//
//  Home01Controller.swift
//  baitap14
//
//  Created by NXH on 8/12/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit
import MVVM

final class ImageCollectionViewViewModel: ViewModel {
    private var listImage: [String] = ["image1", "image2", "image3", "image4", "image5"]
    private var cellViewModel: ImageCollectionViewCellViewModel?
    
    func getNumberImage() -> Int {
        return listImage.count
    }
}

extension ImageCollectionViewViewModel {
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfItems(inSection section: Int) -> Int {
        listImage.count
    }
    
    func getImageCollectionViewCell( atIndexPath indexPath: IndexPath) -> ImageCollectionViewCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < listImage.count  else {
            return nil
        }
        cellViewModel = ImageCollectionViewCellViewModel(nameImage: listImage[indexPath.row])
        return ImageCollectionViewCellViewModel(nameImage: listImage[indexPath.row])
    }
}
