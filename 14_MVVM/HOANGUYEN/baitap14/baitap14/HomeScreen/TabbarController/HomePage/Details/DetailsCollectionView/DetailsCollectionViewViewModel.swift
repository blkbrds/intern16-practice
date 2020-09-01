//
//  DetailsCollectionViewViewModel.swift
//  baitap14
//
//  Created by NXH on 8/17/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import MVVM

final class DetailsCollectionViewViewModel: ViewModel {
    
    private var listImage: [String] = ["img1", "img2", "img3", "img4", "img5"]
    private var cellViewModel: DetailsCollectionViewCellViewModel?
    
    func getNumberImage() -> Int {
        return listImage.count
    }
}

extension DetailsCollectionViewViewModel {
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfItems(inSection section: Int) -> Int {
        return listImage.count
    }
    
    func getImageCollectionViewCell( atIndexPath indexPath: IndexPath) -> DetailsCollectionViewCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < listImage.count  else {
            return nil
        }
        cellViewModel = DetailsCollectionViewCellViewModel(nameImage: listImage[indexPath.row])
        return DetailsCollectionViewCellViewModel(nameImage: listImage[indexPath.row])
    }
}
