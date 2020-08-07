//
//  Calculator.swift
//  BaiTapMVC
//
//  Created by NganHa on 7/20/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

final class Calculator {
  
    static var shared = Calculator()
    
    func congHaiSo(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return firstNumber + secondNumber
    }
    
    func truHaiSo(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return firstNumber - secondNumber
    }
    
    func nhanHaiSo(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return firstNumber * secondNumber
    }
    
    func chiaHaiSo(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return firstNumber / secondNumber
    }
    
    func ketQua(_ firstNumber: Float, _ secondNumber: Float, op: Operator) -> Float {
        switch op {
        case .plus:
            return congHaiSo(firstNumber,secondNumber)
        case .minor:
            return truHaiSo(firstNumber, secondNumber)
        case .multiple:
            return nhanHaiSo(firstNumber, secondNumber)
        case .devide:
            return chiaHaiSo(firstNumber, secondNumber)
        }
    }
}
