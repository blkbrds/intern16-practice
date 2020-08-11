//
//  Calculator.swift
//  baitap10
//
//  Created by NXH on 7/27/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

var result: Float?
final class Calculator {
    
    // MARK: - properties
    private var operatorSave: OperatorStruct.operatorEnum
    private var firstNumber: Float
    private var secondNumber: Float
    // MARK: - init
    init(number1: Float, number2: Float, ope: OperatorStruct.operatorEnum) {
        self.firstNumber = number1
        self.secondNumber = number2
        self.operatorSave = ope
        calculating()
    }
    
    // MARK: - public func
    func calculating() {
        switch operatorSave{
        case .plus:
            result = firstNumber + secondNumber
        case .minus:
            result = firstNumber - secondNumber
        case .mul:
            result = firstNumber * secondNumber
        case .div:
            if secondNumber == 0 {
                result = nil
                return
            }
            result = firstNumber / secondNumber
        case .percent:
            result = Float(Int(firstNumber) % Int(secondNumber))
        case .pow:
            result = powf(firstNumber, secondNumber)
        default:
            return
        }
    }
}

// MARK: - extension
extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
