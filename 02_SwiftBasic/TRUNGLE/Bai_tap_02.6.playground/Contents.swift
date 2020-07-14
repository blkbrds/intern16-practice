import UIKit

func hoanVi(array : [Int]) -> [Int] {
    var newArray  = array
    for i in 0...array.count - 1 {
        let random = Int.random(in: 0...array.count - 1)
        let tmp = newArray[i]
        newArray[i] = newArray[random]
        newArray[random] = tmp
    }
    return newArray
}
print("mang sau khi hoan vi : \(hoanVi(array: [1,45,6,6,78,8,8,9]))")
