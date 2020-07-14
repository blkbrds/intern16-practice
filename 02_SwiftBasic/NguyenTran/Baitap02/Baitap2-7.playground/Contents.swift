import UIKit
import Foundation

func arrReplace(inArr: [Int], elem: Int, subs: Int) -> [Int] {
    var outArr = inArr
    for i in 0..<inArr.count {
        if inArr[i] == elem {
            outArr[i] = subs
        }
    }
    return outArr
}

let a: [Int] = [1, 2, 1]

//Thay the phan tu 1 trong mang bang phan tu 3
print(arrReplace(inArr: a, elem: 1, subs: 3))

