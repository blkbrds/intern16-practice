//
//  People.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/22/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

struct People {
    var username: String
    let image: String
}

struct DataPeople {
    static var listPeople: [People] = [People]()
    
    static func setDataOfPeople() -> [People] {
        var people: [People] = []
        for i in 0..<29 {
            people.append(People(username: "Name \(i + 1)", image: "panda.png"))
        }
        return people
    }
}
