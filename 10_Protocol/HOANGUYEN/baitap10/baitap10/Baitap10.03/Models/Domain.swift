//
//  Domain.swift
//  baitap10
//
//  Created by NXH on 7/21/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
struct Domain {
    
    enum domainEnum {
        case bac
        case trung
        case nam
    }
    
    var domain: String
    var province: [Province]
    
    init(domain: domainEnum) {
        switch domain {
        case .bac:
            
            self.domain = "Nam"
            self.province = [Province(province: .)]
        case .trung:
            self.domain = "Trung"
                       self.district = [District(dis: "Dis Hue 1"), District(dis: "Dis Hue 2"), District(dis: "Dis Hue 3")]
                   default:
                    self.domain = "Nam"
                           self.district = [District(dis: "Dis 1"), District(dis: "Dis 2"), District(dis: "Dis 3")]
                    }
    }
}
