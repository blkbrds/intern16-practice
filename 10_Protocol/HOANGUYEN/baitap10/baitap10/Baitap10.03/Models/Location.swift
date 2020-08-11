//
//  Location.swift
//  baitap10
//
//  Created by NXH on 7/20/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
class Location {
    var places: [String: [String: String]] = [:]
    
    init() {
        readData()
//        print("b")
    }
    
    private func readData() {
        print("a")
        if let path = Bundle.main.path(forResource: "places", ofType: "plist") {
            print("ad")
            if let data = NSDictionary(contentsOfFile: path) {
                for key in data.allKeys {
                    print(data.allValues)
                }
                print(places)
            }
        }
    }
}
