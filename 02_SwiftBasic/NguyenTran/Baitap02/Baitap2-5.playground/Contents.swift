import UIKit
import Foundation

func countsub(st:String, subst:String) -> Int {
    let a = (str.count - substr.count)+1
    var count:Int = 0
    for _ in 1...a {
        let slice = str[str.startIndex..<str.index(str.startIndex, offsetBy: substr.count)]
        if slice == substr {
            count += 1
        }
        str.remove(at: str.startIndex)
    }
    return count
}

print("Day la chuong trinh tinh so lan xuat hien chuoi ",substr," trong chuoi ",str," ")
print("Ket qua:\n\n")

var str = "abaaaabbbabababbaaabababa"

let substr = "ab"

let result:Int = countsub(st:str, subst: substr)

if result == 0 {
    print("Khong xuat hien")
}
else {
    print("So lan xuat hien la \(result) lan")
}



