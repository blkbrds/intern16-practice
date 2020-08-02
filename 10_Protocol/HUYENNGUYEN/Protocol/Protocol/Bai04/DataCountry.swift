//
//  DataCountry.swift
//  Protocol
//
//  Created by bu on 7/30/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation
struct Country {
    var name: String
}
final class DataCountry {
    static let countries: [Country] = {
        let country1 = Country(name: "Quảng Nam")
        let country2 = Country(name: "Đà Nẵng")
        let country3 = Country(name: "Hồ Chí Minh")
        let country4 = Country(name: "Hà Nội")
        
        return [country1, country2, country3, country4]
    }()
}
