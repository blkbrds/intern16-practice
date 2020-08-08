//
//  Caculator.swift
//  BaiTapMVC
//
//  Created by MacBook Pro on 7/20/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class Caculator {
    
    static let shared = Caculator()
    
    // MARK: - Private functons
    private func sumNumber(num1: Float, num2: Float) -> Float {
        return num1 + num2
    }

    private func subNumber(num1: Float, num2: Float) -> Float {
        return num1 - num2
    }

    private func mulNumber(num1: Float, num2: Float) -> Float {
        return num1 * num2
    }

    private func divNumber(num1: Float, num2: Float) -> Float {
        if num2 == 0 {
            return 0
        } else {
            return num1 / num2
        }
    }

    // MARK: - Public functions
    func result(num1: Float, num2: Float, operatorAction: Operator) -> Float{
        switch operatorAction {
            
        case .plus:
            return sumNumber(num1: num1, num2: num2)
        case .sub:
            return subNumber(num1: num1, num2: num2)
        case .mul:
            return mulNumber(num1: num1, num2: num2)
        case .div:
            return divNumber(num1: num1, num2: num2)
        }
    }
}
