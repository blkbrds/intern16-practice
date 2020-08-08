//
//  OperatorAction.swift
//  BaiTapMVC
//
//  Created by MacBook Pro on 8/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

enum Operator {
    case plus
    case sub
    case mul
    case div
}

final class OperatorAction {
    
    var num1: String?
    var num2: String?
    var operatorAction: Operator?

    func performCalculations(action: String) -> Operator {
        if action == "+" {
            return .plus
        } else if action == "-" {
            return .sub
        } else if action == "x" {
            return .mul
        } else {
            return .div
        }
    }

    func deleteNumber() {
        num1 = nil
        num2 = nil
    }
}
