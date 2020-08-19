//
//  MapCellViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/18/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import MapKit

final class MapCellViewModel {
    
    // MARK: - Properties
    private(set) var location: CLLocationCoordinate2D
    private(set) var name: String
    private(set) var address: String
    
    // MARK: - Initialize
    init(location: CLLocationCoordinate2D, name: String, address: String) {
        self.location = location
        self.name = name
        self.address = address
    }
}
