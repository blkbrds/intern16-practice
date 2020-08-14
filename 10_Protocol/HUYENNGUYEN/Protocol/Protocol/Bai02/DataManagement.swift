//
//  DataManagement.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

struct District {
    var name: String
}

struct Province {
    var name: String
    var districts: [District]
}

struct Country {
    var name: String
    var provinces: [Province]
}

final class DataManagement {
    static let countries: [Country] = {
        let district1 = District(name: "Huyện 1")
        let district2 = District(name: "Huyện 2")
        let district3 = District(name: "Huyện 3")
        let district4 = District(name: "Huyện 4")
        let district5 = District(name: "Huyện 5")
        let district6 = District(name: "Huyện 6")
        let district7 = District(name: "Huyện 7")
        let district8 = District(name: "Huyện 8")
        let district9 = District(name: "Huyện 9")
        let district10 = District(name: "Huyện 10")

        let province1 = Province(name: "Tỉnh 1", districts: [district1, district2, district6])
        let province2 = Province(name: "Tỉnh 2", districts: [district3, district9])
        let province3 = Province(name: "Tỉnh 3", districts: [district4])
        let province4 = Province(name: "Tỉnh 4", districts: [district8, district10, district5])
        let province5 = Province(name: "Tỉnh 5", districts: [district7])
        
        let country1 = Country(name: "Miền 1", provinces: [province1])
        let country2 = Country(name: "Miền 2", provinces: [province2, province3])
        let country3 = Country(name: "Miền 3", provinces: [province4])
        
        return [country1, country2, country3]
    }()
}
