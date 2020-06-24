import UIKit
// A - tong cua 20 so fibo
func fibo(n: Int) -> Int {
    var a = 1
    var b = 1
    var c = 0
    for i in 0..<n {
        if i <= 1 {
            c  = i
        } else {
            c = a + b
            a = b
            b = c
        }
    }
    return c
}

func tinhTongFbNsoDauTien(n: Int) -> Int {
    var tong = 0
    for i in 0..<n {
        tong += fibo(n: i)
    }
    return tong
}

let tongFb = tinhTongFbNsoDauTien(n: 5)
print("tong fb la: \(tongFb)")

 // B - Liet ke 20 so fibo dau tien

func listOfFibonacci(n: Int) -> (Int) {
    var f0: Int = 0, f1: Int = 1, fn: Int = 0
    for i in 1...n {
        if i == 1 {
            print(f0)
            continue
        }
        if i == 2 {
            print(f1)
            continue
        }
        fn = f0 + f1
        f0 = f1
        f1 = fn

        print(fn)
    }
    return fn
}
let listOfFb = listOfFibonacci(n: 20)
print(listOfFb)
 
 // C -  Tinh sin x , cos x bang cong thuc chuoi Taylor

let temp: Float = 0.0000001
func calSinX(d: Float) -> Float {
    var Sin: Float = 0
    let X: Float = d * .pi / 180
    var a: Float = X
    var i: Float = 3
    while abs(a) >= temp {
        Sin += a
        a = a * (-(X * X / (i * (i - 1))))
        i = i + 2
    }
    return Sin
}
func calCosX(d: Float) -> Float {
    var Cos: Float = 0
    let f: Float = d * .pi / 180
    var a: Float = f
    var i: Float = 3
    while abs(a) >= temp {
        Cos += a
        a = a * (-1) * (f * f) / (i * (i + 1))
        i = i + 2
    }
    return Cos
}
print ("Sin(30) = \(calSinX(d: 60))")
print ("Cos(30) = \(calCosX(d: 60))")

//D - So Hanh Phuc
func check(n : Int)  {
    var sum: Int = 0
    for i in 1 ..< n  {
        if n % i == 0
        {
             sum += i
        }
    }
    if ( sum == n )  {
        
        print(" \(n) la so hanh phuc")
    }
    else {
        print(" \(n) khong phai la so hanh phuc")
    }
    
}
  check(n: 6)





