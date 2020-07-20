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
    func sumNumber(a: Float, b: Float) -> Float {
        return a + b
    }

    func subNumber(a: Float, b: Float) -> Float {
        return a - b
    }

    func mulNumber(a: Float, b: Float) -> Float {
        return a * b
    }

    func divNumber(a: Float, b: Float) -> Float {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
}
