//
//  Calculator.swift
//  BaiTapMVC
//
//  Created by PCI0004 on 7/20/20.
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

    // MARK: - Function
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
}
