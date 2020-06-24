import UIKit

func tinhTongFibo( n: Int) -> Int {
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

func tinhTongFbNsoDauTien( n : Int) -> Int {
    var tong = 0
    for i in 0..<n {
        tong += tinhTongFibo(n: i)
    }
    return tong
}

let tongFb = tinhTongFbNsoDauTien(n: 5)
print("tong fb la: \(tongFb)")

