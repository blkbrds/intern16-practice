//
//  Location.swift
//  baitap10
//
//  Created by NXH on 7/20/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
struct Location {
    var location: [Domain] = []
    
    init() {
        location.append(Domain(domain: "Bắc"))
        location.append(Domain(domain: "Trung"))
        location.append(Domain(domain: "Nam"))
    }
    
}
