import UIKit

func arrReplace(inputs: [Int], elemToReplace: Int, subElem: Int) -> [Int] {
    var temp = inputs
    for index in 0..<temp.count {
        if temp[index] == elemToReplace {
            temp[index] = subElem
        }
        
    }
    return temp
}
arrReplace(inputs: [1,2,3,1], elemToReplace: 1, subElem: 4)




