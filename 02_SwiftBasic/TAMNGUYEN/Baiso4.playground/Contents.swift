import UIKit
//In 100 fibonachi va tong 100 fibocacchi dau tien

func Fibonacci(n: Int) -> Int {
    if(n == 1 || n == 2){
        return 1
    }else {
        return Int(Fibonacci(n: n - 1) + Fibonacci(n: n - 2))
    }
}
var Tong: Int = 0
for index in 1...10{
    print(" \(Fibonacci(n: index)) ")
    Tong +=  Fibonacci(n: index)
}
print("Tong cua 10 so fibonacci dau tien la : \(Tong)")
// Tinh sin cos bang cong thuc chuoi Taylor


let temp: Float = 0.0000001
func tinhSin(s: Float) -> Float {
    var Sinx: Float = 0
    let X: Float = s * Float.pi / 180
    var a: Float = X
    var i: Float = 3
    while abs(a) >= temp {
        Sinx += a
        a = a * (-(X * X / (i * (i - 1))))
        i = i + 2
    }
    return Sinx
}
func tinhCos(c: Float) -> Float {
    var Cosx: Float = 0
    let f: Float = c * Float.pi / 180
    var a: Float = f
    var i: Float = 3
    while abs(a) >= temp {
        Cosx += a
        a = a * (-1) * (f * f) / (i * (i + 1))
        i = i + 2
    }
    return Cosx
}
print ("Sin(45) = \(tinhSin(s: 45))")
print ("Cos(45) = \(tinhCos(c: 45))")
// so hanh phuc

func numberHappy() {
    var j: Int = 0
    var sum: Int = 0
    var index : Int = 45
    while sum != 1 && sum != 4 {
        sum = 0
        while index > 0 {
            j = index % 10
            sum += (j * j)
            index = index / 10
        }
        index = sum
    }
    if sum == 1 {
        print("happy number")
    } else {
        print(" not happy number")
    }
    
}


numberHappy()











