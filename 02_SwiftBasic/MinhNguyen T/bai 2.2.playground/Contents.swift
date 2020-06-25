import UIKit
import Foundation

// Giai phuong trinh bac 1
func ptb1 (_ b:Float , _ c:Float) -> Any {
    if b == 0 {
        if c == 0 {
            return "Vô số nghiệm"
        }
        else {
            return "Vô nghiệm"
        }
    }
        return (-c / b)
}

// Giai pt bac 2 goi lại pt bac 1
func ptb2 (_ a:Float, _ b:Float, _ c: Float) -> Any {
    if a == 0 {
        return ptb1(b, c)
    }
    else {
        let d:Float = b * b - 4 * a * c
        if d < 0 {
            return "Vô nghiệm"
        }
        if d == 0 {
            return -1.0 * b / a / 2
        }
        else {
            return ((-1.0 * b + sqrtf(d)) / 2 / a , (-1.0 * b - sqrtf(d)) / 2 / a )
        }
    }
}
