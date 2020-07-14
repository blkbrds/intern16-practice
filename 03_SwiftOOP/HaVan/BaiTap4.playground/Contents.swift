import Foundation

class TamGiac {
    var canhA: Int
    var canhB: Int
    var canhC: Int
    
    init(canhA a: Int, canhB b: Int, canhC c: Int) {
        self.canhA = a
        self.canhB = b
        self.canhC = c
    }
    
    func isTamGiac() -> Bool {
        if canhA + canhB > canhC && canhC + canhB > canhA && canhA + canhC > canhB {
            return true
        } else {
            return false
        }
    }
    func isPytago() -> Bool {
        if isTamGiac() == false {
            return false
        } else if canhA * canhA == canhB * canhB + canhC * canhC || canhB * canhB == canhC * canhC + canhA * canhA || canhC * canhC == canhB * canhB + canhA * canhA {
            return true
        } else {
            return false
        }
    }
}
//MARK: Nhập vào mảng tam giác, kiểm tra có thoả mãn định lý pytago hay không
var mangTamGiac = [TamGiac(canhA: 3, canhB: 5, canhC: 6), TamGiac(canhA: 8, canhB: 10, canhC: 6),TamGiac(canhA: 4, canhB: 3, canhC: 5), TamGiac(canhA: 3, canhB: 1, canhC: 9)]
func kiemTraPytago(with mang: [TamGiac]) -> [TamGiac] {
    var tamGiacPtg = [TamGiac]()
    for tamGiac in mang {
        if tamGiac.isPytago() {
            tamGiacPtg.append(tamGiac)
        }
    }
    return tamGiacPtg
}

if kiemTraPytago(with: mangTamGiac).count == 0 {
    print("Không có tam giác nào thoả mãn Pytago")
} else{
    print("Các tam giác thoả mãn Pytago: ")
    for tg in kiemTraPytago(with: mangTamGiac) {
        print("Tam giác có các cạnh : [\(tg.canhA), \(tg.canhB), \(tg.canhC)]")
    }
}
