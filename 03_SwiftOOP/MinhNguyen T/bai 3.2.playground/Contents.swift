import Foundation

// Lop da giac
// Tinh chu vi da giac
class Dagiac {
    var socanh: Int
    var kichthuoc: [Int]
    
    init(socanh: Int, kichthuoc: [Int]) {
        self.socanh = socanh
        self.kichthuoc = kichthuoc
    }
    
    func chuvi() -> Int {
        var chuvi = 0
        for i in 0..<socanh {
            chuvi = chuvi + kichthuoc[i]
            //print("kich thuoc canh \(i+1): \(kichthuoc[i])")
        }
        return chuvi
    }
}

var dagiac = Dagiac(socanh: 5, kichthuoc: [1,2,3,4,5])
dagiac.chuvi()
