import UIKit
import Foundation

func sin(x: Float, n: Int) -> Float {
    var a: Int = 1
    if n % 2 == 0 {
        a = 1
    }
    else {
        a = -1
    }
    var temp: Float = 1
    for index in 1...(2 * n + 1) {
        temp = temp * x / Float(index)
    }
    return Float(a) * temp
}

func rad(y: Float) -> Float {
    let pi: Float = 3.14159
    let a: Float = (y * pi) / 180
    return a
}

//Nhap gia tri do cua goc muon tinh sin, cos
let a: Float = 60

var n: Int = 0
var sin: Float = 0

while abs(sin(x: rad(y: a), n: n)) > 0.000000001 {
    sin += sin(x: rad(y: a), n: n)
    n += 1
}

print("Sin cua goc \(a) do bang \(sin)")
print("Cos cua goc \(a) do bang \(sqrt(1 - sin * sin))")

