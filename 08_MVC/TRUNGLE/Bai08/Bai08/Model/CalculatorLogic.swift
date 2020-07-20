//
//  CalculatorLogic.swift
//  Bai08
//
//  Created by Abcd on 7/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    //MARK: - Function
    func calculate(symbol: String) -> Double? {
        
        if  symbol == "+/-" {
            return number * -1
        } else if symbol == "%" {
            return number  * 0.01
        } else if symbol == "AC" {
            return 0
        }
        return nil
    }
}
