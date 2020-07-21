//
//  Caculator.swift
//  BaiTapMVC
//
//  Created by MacBook Pro on 7/20/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class Caculator {

    // MARK: - Function
    var a: Float
    var b: Float
    
    init(a:Float, b: Float) {
        self.a = a
        self.b = b
    }
    
    func sumNumber() -> Float {
        return a + b
    }

    func subNumber() -> Float {
        return a - b
    }

    func mulNumber() -> Float {
        return a * b
    }

    func divNumber() -> Float {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
}
