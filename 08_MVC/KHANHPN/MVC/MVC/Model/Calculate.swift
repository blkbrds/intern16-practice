//
//  Calculate.swift
//  MVC
//
//  Created by PCI0007 on 7/15/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import Foundation

final class Calculate {
    func add(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func sub(a: Double, b: Double) -> Double {
        return a - b
    }
    
    func mul(a: Double, b: Double) -> Double {
        return a * b
    }
    
    func div(a: Double, b: Double) -> Double {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
}
