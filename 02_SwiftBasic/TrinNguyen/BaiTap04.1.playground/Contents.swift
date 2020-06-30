import Foundation

let epsilon: Float = 0.000001

func sin(x: Float) -> Float {
    var s: Float = 0
    let x1: Float = x * Float.pi / 180
    var a: Float = x1
    var i: Float = 3

    while abs(a) >= epsilon {
        s += a
        a = a * (-(x1 * x1 / (i * (i - 1))))
        i = i + 2
    }
    return s
}

print("Sin(30) = \(sin(x: 30))")
print("Sin(60) = \(sin(x: 60))")
print("Sin(90) = \(sin(x: 90))")
print("Sin(45) = \(sin(x: 45))")
