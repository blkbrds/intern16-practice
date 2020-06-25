import Foundation


func hoanVi (in array: [Int]) -> [Int] {
    var newArr = array
    for i in 0...newArr.count - 1 {
        let randomNumber = Int.random(in: 0...array.count - 1)
        let temp  = newArr[i]
        newArr[i] = newArr[randomNumber]
        newArr[randomNumber] = temp
    }
    return newArr
}
print("Hoán vị mảng : \(hoanVi(in: [1,2,3,4,5]))")

