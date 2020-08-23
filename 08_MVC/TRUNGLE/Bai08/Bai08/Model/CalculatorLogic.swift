//
//  CalculatorLogic.swift
//  Bai08
//
//  Created by Abcd on 7/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    // MARK: - Properties
    private var number: Double?
    var intermediateCalculation: ( n1: Double, calMethod: String)?
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    //MARK: - Function
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n  * 0.01
            case "AC":
                return 0
            case "=" :
                return performTwoNumberCalculation(n2: n)
                
            default:
                intermediateCalculation = (n1: n, calMethod: symbol)
            }
        }
        return nil
    }
    private func performTwoNumberCalculation(n2:Double) ->Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calMethod {
            switch operation {
            case  "+" :
                return n1 + n2
            case "-" :
                return n1 - n2
            case "X" :
                return n1 * n2
            case "÷" :
                return n1 / n2
            default:
                fatalError("error operator")
            }
        }
        return nil
    }
}
