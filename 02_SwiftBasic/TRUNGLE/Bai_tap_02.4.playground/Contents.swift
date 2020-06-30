import UIKit
import Foundation
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

func danhSachFibo(n: Int) -> [Int] {
    var arr = [Int]()
    var f0: Int = 0, f1: Int = 1, fn: Int = 0
    for i in 1...n {
        if i == 1 {
            arr.append(f0)
            continue
        }
        if i == 2 {
           arr.append(f1)
            continue
        }
        fn = f0 + f1
        f0 = f1
        f1 = fn

         arr.append(fn)
    }
    return arr
}
let ds = danhSachFibo(n: 20)
print(ds)
 
 // C -  Tinh sin x , cos x bang cong thuc chuoi Taylor

let epsiolon: Float = 0.0000001
func calSinX(degree: Float) -> Float {
    var Sin: Float = 0
    let X: Float = degree * Float.pi / 180
    var num: Float = X
    var i: Float = 3
    while abs(num) >= epsiolon {
        Sin += num
        num = num * (-(X * X / (i * (i - 1))))
        i = i + 2
    }
    return Sin
}
func calCosX(degree: Float) -> Float {
    var Cos: Float = 0
    let X: Float = degree * .pi / 180
    var num: Float = 1
    var i: Float = 2
    while abs(num) >= epsiolon {
        Cos += num
        num = num * ( -(X * X) / ( i * ( i - 1 )))
        i = i + 2
    }
    return Cos
}
let sinX = calSinX(degree: 1)
print("SinX = \(sinX)")
let cosX = calCosX(degree: 1)
print("CosX = \(cosX)")

//D - So Hanh Phuc
func isHappy(n: Int) -> Bool {
var n = n
   var array = [Int]()
   
   var result = 0
   while true {
       while n > 0 {
           let temp = n % 10
           result += temp * temp
           n /= 10
       }
       if array.contains(result) {
           return false
       }
       array.append(result)
       if result == 1 {
           return true
       }else{
           n = result
           result = 0
       }
      
   }
   
}
let happy = isHappy(n: 44)
print(happy)







