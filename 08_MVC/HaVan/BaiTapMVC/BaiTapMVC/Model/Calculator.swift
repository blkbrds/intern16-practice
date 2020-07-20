//
//  Calculator.swift
//  BaiTapMVC
//
//  Created by NganHa on 7/20/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

enum Operator {
    case plus
    case minor
    case multiple
    case devide
}

class Calculator {
  
    // MARK: - Properties
    private var firstNumber: Float = 0
    private var secondNumber: Float = 0
  
    init(_ firstNumber: Float, _ secondNumber: Float) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }

    
    static func congHaiSo(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return firstNumber + secondNumber
    }
    
    static func truHaiSo(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return firstNumber - secondNumber
    }
    
    static func nhanHaiSo(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return firstNumber * secondNumber
    }
    
    static func chiaHaiSo(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return firstNumber / secondNumber
    }
    
    static func thucHienPhepTinh(phepTinh: String) -> Operator {
        if phepTinh == "+" {
            return .plus
        } else if phepTinh == "-" {
            return .minor
        } else if phepTinh == "x" {
            return .multiple
        } else {
            return .devide
        }
    }
    
    static func ketQua(_ toanTu: Calculator, op: Operator) -> Float {
        switch op {
        case .plus:
            return congHaiSo(toanTu.firstNumber, toanTu.secondNumber)
        case .minor:
            return truHaiSo(toanTu.firstNumber, toanTu.secondNumber)
        case .multiple:
            return nhanHaiSo(toanTu.firstNumber, toanTu.secondNumber)
        case .devide:
            return chiaHaiSo(toanTu.firstNumber, toanTu.secondNumber)
        }
    }

}
