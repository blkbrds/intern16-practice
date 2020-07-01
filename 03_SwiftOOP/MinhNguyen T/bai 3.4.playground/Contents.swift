import Foundation

class Pitago {
    var mangcanh: [[Int]]
    
    init(mangcanh :[[Int]]) {
        self.mangcanh = mangcanh
    }
    
    func isPitago(cacCanh : [Int]) -> Bool {
        guard cacCanh.count == 3 else { return false }
        if  cacCanh[0] * cacCanh[0] + cacCanh[1] * cacCanh[1] == cacCanh[2] * cacCanh[2] ||
            cacCanh[1] * cacCanh[1] + cacCanh[2] * cacCanh[2] == cacCanh[0] * cacCanh[0] ||
            cacCanh[0] * cacCanh[0] + cacCanh[2] * cacCanh[2] == cacCanh[1] * cacCanh[1] {
            return true
        }
        return false
    }
    
    func piTago() {
        for i in 0 ..< mangcanh.count where isPitago(cacCanh: mangcanh[i]) {
            print(mangcanh[i])
        }
//        var i = 0
//        while i < canh.count {
//            if isPitago(cacCanh: canh[i]) {
//                print(canh[i])
//            }
//            i += 1
//        }
    }
}

var tgV = Pitago(mangcanh: [[3, 4, 5], [3, 4, 10]])
tgV.piTago()
