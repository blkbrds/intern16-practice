import UIKit

func replaceArray(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var temp = inputArray
    for index in 0..<temp.count where temp[index] == elemToReplace {
        temp[index] = substitutionElem
    }
    return temp
}
print(replaceArray(inputArray: [1, 2, 1, 4, 2], elemToReplace: 1, substitutionElem: 3))

