//
//  Calculator.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 9/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import Foundation

final class Calculator {

    // MARK: - Properties
    var a: Float = 0.0
    var b: Float = 0.0

    // MARK: Initialize
    init(a: Float, b: Float) {
        self.a = a
        self.b = b
    }

    // MARK: - Functions
    func add() -> Float {
        return a + b
    }

    func subtract() -> Float {
        return a - b
    }

    func multiply() -> Float {
        return a * b
    }

    func divide() -> Float {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }

//    func modulo() -> Float {
//        return Float(a % b)
//    }

    func exponetial() -> Float {
        return pow(a, b)
    }
}
