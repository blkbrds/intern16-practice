//
//  CalculatorFactory.swift
//  BaiTapMVC
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

enum Operator {
    case plus
    case minor
    case multiple
    case devide
}

final class CalculatorFactory {
    var num1: String?
    var num2: String?
    var op: Operator?
    
    func thucHienPhepTinh(phepTinh: String) -> Operator {
        if phepTinh == "+" {
            return .plus
        } else if phepTinh == "-" {
            return .minor
        } else if phepTinh == "x" {
            return .multiple
        } else {
            return .devide
        }
    }
    
    func deleteNumber() {
        num1 = nil
        num2 = nil
    }
}
