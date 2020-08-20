//
//  SliderCellViewModel.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/16/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class SliderCellViewModel {
    
    // MARK: Properties
    private(set) var sliderData: Images?
    
    // MARK: - Initialize
    init(sliderData: Images? = nil) {
        self.sliderData = sliderData
    }
}
