import UIKit
import Foundation
// Fibonacci
func Fibonacci(n: Int) -> Int {
  if n <= 2 {
    return 1
  }
    return Fibonacci(n: n - 1) + Fibonacci(n: n - 2)
}

func tong (n: Int) -> Int{
    var sum:Int = 0
    for i in 0...n{
        sum = sum + Fibonacci(n: i)
    }
    return sum
}
tong(n: 5)

// Liet ke n so fibo dau tien
func lietKe(n: Int){
    for i in 1...n {
        let fi = Fibonacci(n: i)
        print(fi)
    }
}

// Sin x taylor

func sin(x: Float)-> Float{
    var S: Float = 0
    let rad:Float = x*Float.pi/180
    var a:Float = rad
    var i:Float = 3
    
    while abs(a) >= 0.00001{
        S  += a
        a = a*(-(rad*rad/(i*(i-1))))
        i = i + 2
    }
    return S
}
// Cos x

func cos(x: Float)-> Float {
    return sqrt(1 - powf(sin(x),2))
}

// kiem tra so hanh phuc

func isHanhPhuc(n: Int)-> Bool {
    let str: String = String(n)
    var str1: Int = 0
    var str2: Int = 0
    let d:Int = str.count / 2
    var dem:Int = 1

    for i in str {
        if dem <= d {
            str1 = str1 + Int(String(i))!
        }else{
            str2 = str2 + Int(String(i))!
        }
        dem = dem + 1
    }
    if str1 != str2 {
        return false
    }
    return true
}

// In ra n so hp dau tien

func sHp(n: Int){
    var index: Int = 1
    while (index < n) {
        if (isHanhPhuc(n: index)) {
                print(index)
        }
        index += 1
    }
}

