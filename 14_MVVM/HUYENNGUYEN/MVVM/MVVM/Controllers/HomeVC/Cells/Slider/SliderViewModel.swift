//
//  SliderViewModel.swift
//  MVVM
//
//  Created by bu on 8/26/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

class SliderViewModel {
    
    // MARK: - Properties
    var sliderImages: Slider
    var image: String {
        return sliderImages.image
    }
    
    // MARK: - Initialization
    init(sliderImages: Slider) {
        self.sliderImages = sliderImages
    }
}
