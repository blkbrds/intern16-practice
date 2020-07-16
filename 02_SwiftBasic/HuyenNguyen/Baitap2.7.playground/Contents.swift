import UIKit

func replaceArr(_ inputArray: [Int], _ elemToReplace: Int, _ substitutionElement: Int) -> [Int] {
    var newArr = inputArray
    for i in 0 ..< inputArray.count {
        if (elemToReplace == inputArray[i]) {
            newArr[i] = substitutionElement
        }
    }
    return newArr
}

print(replaceArr([1,2,1], 1, 3))
