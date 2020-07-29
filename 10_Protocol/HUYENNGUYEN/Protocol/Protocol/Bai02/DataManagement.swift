//
//  DataManagement.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

struct Huyen {
    var name: String
}

struct Tinh {
    var name: String
    var huyens: [Huyen]
}

struct Mien {
    var name: String
    var tinhs: [Tinh]
}

final class DataManagement {
    static let miens: [Mien] = {
        let huyen1 = Huyen(name: "Huyen 1")
        let huyen2 = Huyen(name: "Huyen 2")
        let huyen3 = Huyen(name: "Huyen 3")
        let huyen4 = Huyen(name: "Huyen 4")
        
        let tinh1 = Tinh(name: "Tinh 1", huyens: [huyen1, huyen2])
        let tinh2 = Tinh(name: "Tinh 2", huyens: [huyen3])
        let tinh3 = Tinh(name: "Tinh 3", huyens: [huyen4])
        
        let mien1 = Mien(name: "Mien 1", tinhs: [tinh1])
        let mien2 = Mien(name: "Mien 2", tinhs: [tinh2, tinh3])
        
        return [mien1, mien2]
    }()
}
