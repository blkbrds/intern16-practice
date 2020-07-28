//
//  File.swift
//  Protocol
//
//  Created by PCI0001 on 7/26/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class CalculatorBrain {
    
    func add(a: Float, b: Float) -> Float {
        return a + b
    }
    
    func sub(a: Float, b: Float) -> Float {
        return a - b
    }
    
    func mul(a: Float, b: Float) -> Float {
        return a * b
    }
    
    func div(a: Float, b: Float) -> Float {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
}
