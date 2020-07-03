import Foundation
import UIKit
    class TamGiac {
        var canhA = 0.0
        var canhB = 0.0
        var canhC = 0.0
    
    init(canhA: Double, canhB: Double, canhC: Double) {
        guard canhA > 0 else {
            return
        }
        self.canhA = canhA
        guard canhB > 0 else {
            return
        }
        self.canhB = canhB
        guard canhC > 0 else {
            return
        }
        self.canhC = canhC
    }
    
    func PyTaGo() -> (result: Bool, outPut: [Double]) {
        if canhA == sqrt(pow(canhB, 2) + pow(canhC, 2))
            || canhB == sqrt(pow(canhA, 2) + pow(canhC, 2))
            || canhC == sqrt(pow(canhB, 2) + pow(canhA, 2)) {
            return (true, [canhA, canhB, canhC])
        }
        return (false, [])
    }
}



var input: [TamGiac] = [TamGiac(canhA: 1, canhB: 2, canhC: 3),
                        TamGiac(canhA: 2, canhB: 3, canhC: 4),
                        TamGiac(canhA: 3, canhB: 4, canhC: 5)]


class CheckTamGiac {
    var tamgiac: [TamGiac]
    
    init(tamgiac: [TamGiac]) {
        self.tamgiac = tamgiac
    }
    
    func checkPyTaGo(tg: [TamGiac]) -> Void {
        tamgiac.forEach { (tg) in
            let check = tg.PyTaGo()
            if check.result {
                print(check.outPut)
            }
        }
    }
}

let checkTamGiac = CheckTamGiac(tamgiac: input)

checkTamGiac.checkPyTaGo(tg: input)

