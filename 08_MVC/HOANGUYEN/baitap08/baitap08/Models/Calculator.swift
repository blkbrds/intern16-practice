//
//  calculator.swift
//  baitap08
//
//  Created by NXH on 7/14/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

//MARK: - Singleton
var shareCalculator: Calculator = {
    var calculator: Calculator = Calculator(calcul: 0, opera: .plus)
    calculator.result = calculator.processingCalculator()!
    return calculator
}()

struct Calculator {
    
    // MARK: - Properties
    var calculators: [Float] = [0, 0]
    var result: Float = 0
    var operato: Operator.operatorEnum
    
    // MARK: - Initialize
    init(calcul: Float, opera: Operator.operatorEnum) {
        self.calculators[1] = calcul
        self.operato = opera
    }
    
    mutating func processingCalculator() -> Float? {
        
        switch operato {
        case .plus:
            result = calculators[0] + calculators[1]
        case .minus:
            result = calculators[0] - calculators[1]
        case .mul:
            result = calculators[0] * calculators[1]
        case .div:
            if calculators[1] == 0 {
                return nil
            }
            result = Float(calculators[0] / calculators[1])
            
        default:
            result = Float(calculators[0])
        }
        calculators[0] = result
        return result
    }
}
