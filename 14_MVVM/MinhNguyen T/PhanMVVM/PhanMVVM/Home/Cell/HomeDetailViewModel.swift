//
//  HomeDetailViewModel.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class HomeDetailViewModel {
    
    // MARK: - Peroperties
    private(set) var data: Data?
    
    // MARK: - Initialize
    init(data: Data? = nil) {
        self.data = data
    }
}
