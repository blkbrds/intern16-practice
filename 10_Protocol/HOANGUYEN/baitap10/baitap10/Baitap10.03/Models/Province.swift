//
//  Province.swift
//  baitap10
//
//  Created by NXH on 7/21/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
struct Province {
    enum provinceEnum {
        case daNang
        case quangNam
        case quangBinh
        case quangTri
        case hue
    }
    var province: String
    var district: [District]
    
    init(domain: Domain) {
        
        switch domain.domain {
        case "Bắc":
            <#code#>
        case "Trung":
            
        default:
            <#code#>
        }
        
    }
    
}
