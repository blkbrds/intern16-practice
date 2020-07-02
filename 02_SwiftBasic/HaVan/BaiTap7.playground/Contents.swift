import Foundation

func bearrayReplace(inputArray array: [Int], elemToReplace replace: Int,
                substitutionElem sub: Int) -> [Int] {
    var newArr = array
    for i in 0...newArr.count - 1 {
        if newArr[i] == replace {
            newArr[i] = sub
        }
    }
    return newArr
}

print("Thay thế 3 vào mảng [1,2,1], ta được kết quả: \(bearrayReplace(inputArray: [1,2,1], elemToReplace: 1, substitutionElem: 3))")
