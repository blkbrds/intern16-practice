import UIKit

class Dagiac {
    var socanh: Int
    var kichthuoc: [Int]
    
    init(socanh: Int, kichthuoc: [Int]) {
        self.socanh = socanh
        self.kichthuoc = kichthuoc
    }
    
    func chuvi()-> (Int) {
        var chuvi = 0
        for i in 0..<socanh {
            chuvi = chuvi + kichthuoc[i]
            //print("kich thuoc canh \(i+1): \(kichthuoc[i])")
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
    
    func kiemtraTamgiac() -> Bool {
        if (a + b > c) && (a + c > b) && (b + c > a){
            return true
        }
        return false
    }
    override func chuvi() -> (Int) {
        if kiemtraTamgiac() == true {
            return (a + b + c)
        }
        return 0
    }
    
    func tinhDienTich() -> (Double) {
        if kiemtraTamgiac() == true {
            let BinhPhuong = (a + b + c) * (a + b - c) * (b + c - a) * (c + a - b)
            return sqrt(Double(BinhPhuong)) / 4
        }
        return 0
    }
}

var tamgiac1 = TamGiac(kichThuocDaGiac: [0,0,0])
tamgiac1.chuvi()
