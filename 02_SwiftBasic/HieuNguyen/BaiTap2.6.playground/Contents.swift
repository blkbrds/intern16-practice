import UIKit

var array = [0,1,2,3,4,5,6,7,8,9]

func hoanDoi(array2 : [Int]) -> [Int] {
    var array: [Int] = array2
    for _ in 1...Int.random(in: 0 ..< 10) {
        let number1 = Int.random(in: 0 ..< array.count)
        let number2 = Int.random(in: 0 ..< array.count)
        array.swapAt(number1, number2)
    }
    return array
}
print(hoanDoi(array2: array))
// array.shuffle()
