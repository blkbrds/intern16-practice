//
//  Calculator.swift
//  Baitap8MVC
//
//  Created by MBA0245P on 8/30/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import Foundation

enum Operation: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
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
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
