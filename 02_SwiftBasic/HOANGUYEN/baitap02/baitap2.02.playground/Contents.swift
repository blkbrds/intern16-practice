import UIKit
import Foundation

func ptb1 (_ b:Float , _ c:Float) -> Any {
    if b == 0 {
        if c == 0 {
            return "Vô số nghiệm"
        }
        else {
            return "Vô nghiệm"
        }
    }
        return -1.0 * (c / b)
}

func ptb2 (_ a:Float, _ b:Float, _ c: Float) -> Any {
    if a == 0 {
        return ptb1(b, c)
    }
    else {
        let delta:Float = b * b - 4 * a * c
        if delta < 0 {
            return "Vô nghiệm"
        }
        if delta == 0 {
            return -1.0 * b / a / 2
        }
        else {
            return ((-1.0 * b + sqrtf(delta)) / a / 2 , (-1.0 * b - sqrtf(delta)) / a / 2 )
        }
    }
}

ptb2(0, 0, 1)


