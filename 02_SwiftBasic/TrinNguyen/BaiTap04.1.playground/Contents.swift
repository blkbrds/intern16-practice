import UIKit
import Foundation

let epsilon: Float = 0.000001

func sin(x: Float) -> Float {
    var S: Float = 0
    let X: Float = x * Float.pi / 180
    var a: Float = X
    var i: Float = 3

    while abs(a) >= epsilon {
        S += a
        a = a * (-(X * X / (i * (i - 1))))
        i = i + 2
    }
    return S
}
print("Sin(30) = \(sin(x: 30))")
print("Sin(60) = \(sin(x: 60))")
print("Sin(90) = \(sin(x: 90))")
print("Sin(45) = \(sin(x: 45))")

