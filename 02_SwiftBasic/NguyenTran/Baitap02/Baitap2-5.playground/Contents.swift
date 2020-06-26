import UIKit
import Foundation

func countsub(st: String, subst: String) -> Int {
    var count: Int = 0
    for _ in 1...(str.count - substr.count) + 1 {
        let slice = str[str.startIndex..<str.index(str.startIndex, offsetBy: substr.count)]
        if slice == substr {
            count += 1
        }
        str.remove(at: str.startIndex)
    }
    return count
}

var str = "abaaaabbbabababbaaabababa"

let substr = "ab"

let result: Int = countsub(st: str, subst: substr)

if result == 0 {
    print("Khong xuat hien")
}
else {
    print("So lan xuat hien la \(result) lan")
}



