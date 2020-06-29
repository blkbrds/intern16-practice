import UIKit

class Dagiac{
    var socanh:Int
    var kichthuoc: [Int]
    init(socanh: Int, kichthuoc: [Int]) {
        self.socanh = socanh
        self.kichthuoc = kichthuoc
    }
    func chuvi()-> Int {
        var chuvi = 0
        for i in 0..<socanh{
            chuvi = chuvi + kichthuoc[i]
            print("kich thuoc canh \(i+1): \(kichthuoc[i])")
        }
        return chuvi
    }
}

class TamGiac: Dagiac {
    var a: Int
    var b: Int
    var c: Int
    init(kichThuocDaGiac: [Int]) {
        a = kichThuocDaGiac[0]
        b = kichThuocDaGiac[1]
        c = kichThuocDaGiac[2]
        super.init(socanh: 3, kichthuoc: [a,b,c])
    }
    override func chuvi() -> Int {
        return a + b + c
    }
    func tinhDienTich() -> Double {
        let BinhPhuong = (a + b + c) * (a + b - c) * (b + c - a) * (c + a - b)
        return (sqrt(Double(BinhPhuong))) / 4
    }
}
