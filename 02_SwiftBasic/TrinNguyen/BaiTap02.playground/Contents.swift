import UIKit
import Foundation

func GPTB2 (a: Float, b: Float, c: Float) -> (Float, Float, Float) {
    let delta: Float = b * b - (4 * a * c)
    if(delta < 0) {
        let x1: Float = 0.0
        let x2: Float = 0.0
        return (0, x1, x2)
    } else if(delta == 0) {
        let x1 = -b / (2 * a)
        let x2 = -b / (2 * a)
        return (1, x1, x2)
    } else {
        let x1 = (-b + sqrt(delta)) / (2 * a)
        let x2 = (-b - sqrt(delta)) / (2 * a)
        return (2, x1, x2)
    }
}

if(GPTB2(a: 1, b: 2, c: 1).0 == 0) {
    print("Phuong trinh vo nghiem")
} else if(GPTB2(a: 1, b: 2, c: 1).0 == 1) {
    print("Phuong trinh co nghiem kep: x1,x2 = \(GPTB2(a: 1, b: 2, c: 1).1)")
} else {
    print("Phuong trinh co 2 ngiem phan biet: x1=\(GPTB2(a: 1, b: 2, c: 1).1) x2=\(GPTB2(a: 1, b: 2, c: 1).2)")
}
