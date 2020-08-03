//
//  DataCountry.swift
//  Protocol
//
//  Created by bu on 7/30/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation
struct Countries {
    var name: String
}
final class DataCountry {
    static let countries: [Countries] = {
        let country1 = Countries(name: "Quảng Nam")
        let country2 = Countries(name: "Đà Nẵng")
        let country3 = Countries(name: "Hồ Chí Minh")
        let country4 = Countries(name: "Hà Nội")
        
        return [country1, country2, country3, country4]
    }()
}
