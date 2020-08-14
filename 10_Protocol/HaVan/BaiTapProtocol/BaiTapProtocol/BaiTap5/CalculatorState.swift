//
//  CalculatorState.swift
//  BaiTapProtocol
//
//  Created by NganHa on 8/14/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

enum Operator {
    case plus
    case minor
    case multiple
    case devide
    case percent
    case power
}

final class CalculatorState {
    
    // MARK: - Properties
    private(set) var firstNumber: Float?
    private(set) var secondNumber: Float?
    
    func setFirstNumber(number: Float?) {
        firstNumber = number
    }
    
    func setSecondNumber(number: Float?) {
        secondNumber = number
    }
}
