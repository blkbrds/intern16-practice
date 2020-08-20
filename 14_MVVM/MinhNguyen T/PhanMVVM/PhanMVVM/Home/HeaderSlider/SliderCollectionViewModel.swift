//
//  SliderCollectionViewModel.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/16/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class SliderCollectionViewModel {
    
    // MARK: - Peroperties
    private(set) var sliderImage: [Images] = []
    
    // MARK: - Public functions
    func getImageSlider() {
        for item in 0..<images.count {
            sliderImage.append(images[item])
        }
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return sliderImage.count
    }
    
    func getSliderCellModel(atIndexPath indexPath: IndexPath) -> SliderCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < sliderImage.count else { return nil }
        return SliderCellViewModel(sliderData: sliderImage[indexPath.row])
    }
}

let images: [Images] = [Images(imagename: "cf1"),
                        Images(imagename: "cf2"),
                        Images(imagename: "cf3"),
                        Images(imagename: "cf4"),
                        Images(imagename: "cf5")]
