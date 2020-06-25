import UIKit
import Foundation

//Bai tap liet ke so hanh phuc nho hon 10000
//Số hạnh phúc là số n có 2k chữ số
//* mà tổng k chữ số đầu = tổng k chữ số cuối đồng thời
//* n phải là số nguyên tố .
//* Nếu n có 2k-1 chữ số thì ngầm hiểu là có thêm số 0 ở đầu chữ số
func len(n:Int) -> Int {
    var temp = n
    var count: Int = 0
    while temp >= 1 {
        count += 1
        temp = temp/10
    }
    return count
}

func luythua(x:Int, y: Int) -> Int {
    var luythua:Int = 1
    for _ in 1...y {
        luythua = luythua * x
    }
    return luythua
}

func sumNum(i:Int) -> Int {
    var num = i
    var temp:Int = 0, sumNum: Int = 0
    while num >= 1 {
        temp = num%10
        sumNum = sumNum + temp
        num = num/10
    }
    return sumNum
}

func happyNum(x: Int) -> Bool {
    var a:Int = 0
    if len(n: x)%2 == 0 {
        a = luythua(x:10, y:len(n: x)/2)
    }
    else {
        a = luythua(x:10, y:(len(n: x)/2)+1)
    }
    let p1:Int = x/a
    let p2:Int = x%a
    if sumNum(i: p1) == sumNum(i: p2) {
        return true
    }
    else {return false}
}

print("List nhung so hanh phuc nho hon 10000")

for index in 1...1000 {
    if happyNum(x: index) == true {
        print("\(index)")
    }
}

//let a = 532
//
//if happyNum(x:a) == true {
//    print("a la so hanh phuc.")
//}
//else {
//    print("a khong phai la so hanh phuc")
//}

