//
//  operatorStruct.swift
//  baitap10
//
//  Created by NXH on 7/27/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

struct OperatorStruct {
    
    var operatorSelect: operatorEnum
    
    enum operatorEnum {
        case plus
        case minus
        case mul
        case div
        case pow
        case percent
        case none
    }
}
