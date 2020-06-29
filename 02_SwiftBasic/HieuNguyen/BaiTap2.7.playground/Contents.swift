import UIKit

var array = [1,2,3,3,5,6,5,3,9]
let elemToReplace = 3
let substitutionElem = 10

func hoanDoi(array2 : [Int]) -> [Int] {
    var array: [Int] = array2
    for i in 0..<array.count {
        if array[i] == elemToReplace {
            array[i] = substitutionElem
        }
    }
    return array
}

print(hoanDoi(array2: array))
