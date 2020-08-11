//
//  Cell.swift
//  baitap12
//
//  Created by NXH on 8/3/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

struct Cell {
    let imageString: String
    let nameString: String
    
    init(image: String?, name: String?) {
        self.imageString = image ?? "default"
        self.nameString = name ?? "No Name"
    }
}
