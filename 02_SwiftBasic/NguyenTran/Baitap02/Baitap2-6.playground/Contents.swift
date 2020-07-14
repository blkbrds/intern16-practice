import UIKit
import Foundation

func hoanvi(arr: [Int]) -> [Int]{
    var newArr = arr
    for i in 0..<arr.count {
        let random = Int.random(in: 0..<arr.count)
        let temp = newArr[i]
        newArr[i] = newArr[random]
        newArr[random] = temp
    }
    return newArr
}

var arr: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

print("Mang ban dau \(arr)")
print("Mang sau khi hoan vi random \(hoanvi(arr: arr))")

