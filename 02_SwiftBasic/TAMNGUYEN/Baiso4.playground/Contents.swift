import UIKit
//In 100 fibonachi va tong 100 fibocacchi dau tien

func Fibonacci(n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    } else {
        return Int(Fibonacci(n: n - 1) + Fibonacci(n: n - 2))
    }
}

var tong: Int = 0

for index in 1...10 {
    print(" \(Fibonacci(n: index)) ")
    tong += Fibonacci(n: index)
}

print("Tong cua 10 so fibonacci dau tien la : \(tong)")
// Tinh sin cos bang cong thuc chuoi Taylor

let temp: Float = 0.0000001

func tinhSin(s: Float) -> Float {
    var sinx: Float = 0
    let x: Float = s * Float.pi / 180
    var a: Float = x
    var i: Float = 3
    while abs(a) >= temp {
        sinx += a
        a = a * (-(x * x / (i * (i - 1))))
        i = i + 2
    }
    return sinx
}

func tinhCos(c: Float) -> Float {
    var cosx: Float = 0
    let f: Float = c * Float.pi / 180
    var a: Float = f
    var i: Float = 3
    while abs(a) >= temp {
        cosx += a
        a = a * (-1) * (f * f) / (i * (i + 1))
        i = i + 2
    }
    return cosx
}

print ("Sin(45) = \(tinhSin(s: 45))")
print ("Cos(45) = \(tinhCos(c: 45))")

func check(num: inout Int) -> Bool {
    var j: Int = 0
    var sum: Int = 0
    while sum != 1 && sum != 4 {
        sum = 0
        while num > 0 {
            j = num % 10
            sum += (j * j)
            num = num / 10
        }
        num = sum
    }
    return true
}
