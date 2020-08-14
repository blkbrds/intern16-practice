//
//  Calculation.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/28/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

final class Calculator {
    
    // MARK: - Properties
    static var shared = Calculator()
    
    // MARK: - Public functions
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
    
    func phanTram(_ number: Float) -> Float {
        return number / 100
    }
    
    func luyThua(_ firstNumber: Float, _ secondNumber: Float) -> Float {
        return powf(firstNumber, secondNumber)
    }
    
    func thucHienPhepTinh(phepTinh: String) -> Operator {
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
    
    func ketQua(firstNumber: Float, secondNumber: Float, result: Float?, op: Operator) -> Float? {
        switch op {
        case .plus:
            return congHaiSo(firstNumber, secondNumber)
        case .minor:
            return truHaiSo(firstNumber, secondNumber)
        case .multiple:
            return nhanHaiSo(firstNumber, secondNumber)
        case .devide:
            return chiaHaiSo(firstNumber, secondNumber)
        case .percent:
            guard let ketQua = result else {
                return nil
            }
            return phanTram(ketQua)
        case .power:
            return luyThua(firstNumber, secondNumber)
        }
    }
}
