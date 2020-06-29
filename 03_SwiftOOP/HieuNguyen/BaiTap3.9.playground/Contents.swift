import UIKit

class Mang1c {
    var phanTu: [Int]
    
    init(mang: [Int]) {
        phanTu = mang
    }
    
    func inMang() {
        print(phanTu)
    }
    func find() -> (Int?, Int?){
        return (phanTu.min(), phanTu.max())
    }
}
var mang = Mang1c(mang: [1,3,5,0,3,13])
mang.inMang()
mang.find()
