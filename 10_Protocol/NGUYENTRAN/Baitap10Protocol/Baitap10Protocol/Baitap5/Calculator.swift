//
//  Calculator.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import Foundation

enum Operation: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case power = "%"
    case percent = "x^y"
    case null = "null"
}

class Calculator {

    func add(a: String, b: String) -> String {
        let result = a.floatValue + b.floatValue
        return String(result)
    }

    func sub(a: String, b: String) -> String {
        let result = a.floatValue - b.floatValue
        return String(result)
    }

    func mul(a: String, b: String) -> String {
        let result = a.floatValue * b.floatValue
        return String(result)
    }

    func div(a: String, b: String) -> String {
        if b.floatValue == 0 {
            return "0"
        } else {
            let result = a.floatValue / b.floatValue
            return String(result)
        }
    }

    func power(a: String, b: String) -> String {
        let result = powf(a.floatValue, b.floatValue)
        return String(result)
    }

    func percent(a: String) -> String {
        let result = a.floatValue / 100
        return String(result)
    }
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
