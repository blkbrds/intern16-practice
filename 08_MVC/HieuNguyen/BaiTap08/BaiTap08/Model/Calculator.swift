//
//  Calculator.swift
//  BaiTap08
//
//  Created by PCI0020 on 7/7/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import Foundation

class Calculator {
    
    private static var usedCalculator: Calculator = {
        let calculator = Calculator()
        return calculator
    }()
    
    class func shared() -> Calculator {
        return usedCalculator
    }
    
    private init() {
        
    }
    
    func operatorCal(a: Int, b: Int, operatorCurrent: Int) -> Int{
        switch operatorCurrent {
        case -4:
            return a + b
        case -3:
            return a - b
        case -2:
            return a * b
        case -1:
            return a / b
        default:
            return 0
        }
    }
}
