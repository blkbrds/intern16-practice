//
//  Calculation.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/28/20.
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
    
    static func phanTram(_ number: Float) -> Float {
        return number / 100
    }
    
    static func luyThua(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return powf(firstNumber, secondNumber)
    }
    
    static func thucHienPhepTinh(phepTinh: String) -> Operator {
        if phepTinh == "+" {
            return .plus
        } else if phepTinh == "-" {
            return .minor
        } else if phepTinh == "x" {
            return .multiple
        } else if phepTinh == "/" {
            return .devide
        } else if phepTinh == "%" {
            return .percent
        } else {
            return .power
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
        case .percent:
            return phanTram(toanTu.firstNumber)
        case .power:
            return luyThua(toanTu.firstNumber, toanTu.secondNumber)
            }
    }

}

