//
//  IntroductionViewModel.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/20/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class IntroductionViewModel {
    
    // MARK: - Peroperties
    private(set) var description: String
    
    // MARK: - Initialize
    init(description: String = "") {
        self.description = description
    }
}
