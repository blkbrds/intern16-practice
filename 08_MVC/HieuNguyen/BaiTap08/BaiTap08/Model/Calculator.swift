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
    
    class func used() -> Calculator {
        return usedCalculator
    }
    
    private init() {
        
    }
    
    func plus() {
        
    }
    
    func minus() {
        print("-")
    }
    
    func devide() {
        print("*")
    }
    
    func multiple() {
        print("/")
    }
}
