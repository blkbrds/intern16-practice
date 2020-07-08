import Foundation

func shuffleArray(array: [Int]) -> [Int] {
    var arrayNew = array
    
    for i in 0 ..< arrayNew.count {
        let randomNumber = Int.random(in: 0 ..< array.count)
        let temp = arrayNew[i]
        arrayNew[i] = arrayNew[randomNumber]
        arrayNew[randomNumber] = temp
    }
    return arrayNew
}

print(shuffleArray(array: [1, 2, 3, 4, 5, 6, 7, 8, 9]))
