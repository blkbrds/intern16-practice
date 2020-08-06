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
    
    func thucHienPhepTinh(phepTinh: String) -> Operator {
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
