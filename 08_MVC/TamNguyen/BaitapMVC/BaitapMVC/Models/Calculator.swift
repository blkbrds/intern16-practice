//
//  Caculator.swift
//  BaitapMVC
//
//  Created by PCI0001 on 7/20/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class Calculator {
    
    // MARK: - Functions
    func addTwoNumber(a: Float, b: Float) -> Float {
        return a + b
    }
    
    func subTwoNumber(a: Float, b: Float) -> Float {
        return a - b
    }
    
    func mulTwoNumber(a: Float, b: Float) -> Float {
        return a * b
    }
    
    func divTwoNumber(a: Float, b: Float) -> Float {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
}

