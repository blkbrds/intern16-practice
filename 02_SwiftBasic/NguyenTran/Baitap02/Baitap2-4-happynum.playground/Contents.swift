import UIKit
import Foundation

//Bai tap liet ke so hanh phuc nho hon 10000
//Số hạnh phúc là số n có 2k chữ số
//* mà tổng k chữ số đầu = tổng k chữ số cuối đồng thời
//* Nếu n có 2k-1 chữ số thì ngầm hiểu là có thêm số 0 ở đầu chữ số

func length(n: Int) -> Int {
    var temp = n
    var count: Int = 0
    while temp >= 1 {
        count += 1
        temp = temp / 10
    }
    return count
}

func luythua10(x: Int) -> Int {
    var luythua: Int = 1
    for _ in 1...x {
        luythua = luythua * 10
    }
    return luythua
}

func sumNum(i: Int) -> Int {
    var num = i
    var temp: Int = 0, sumNum: Int = 0
    while num >= 1 {
        temp = num % 10
        sumNum = sumNum + temp
        num = num / 10
    }
    return sumNum
}

func happyNum(x: Int) -> Bool {
    var a: Int = 0
    if length(n: x) % 2 == 0 {
        a = luythua10(x: length(n: x) / 2)
    }
    else {
        a = luythua10(x: (length(n: x) / 2) + 1)
    }
    let part1: Int = x / a
    let part2: Int = x % a
    if sumNum(i: part1) == sumNum(i: part2) {
        return true
    }
    else { return false }
}

let a = 1000
print("List nhung so hanh phuc nho hon \(a)")

for index in 1..<a {
    if (happyNum(x: index)) {
        print("\(index)")
    }
}
