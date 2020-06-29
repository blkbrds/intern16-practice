import UIKit

class DaGiac {
    let soCanh: Int
    let kichThuocCanh: [Float]
    
    init(soCanh: Int, kichThuocCanh: [Float]) {
        self.soCanh = soCanh
        self.kichThuocCanh = kichThuocCanh
    }
    
    func tinhChuVi() -> Float {
        var chuVi: Float = 0
        for i in 0...soCanh - 1 {
            chuVi += kichThuocCanh[i]
        }
        return chuVi
    }
    
    func inGiaTri() -> [Float] {
        return kichThuocCanh
    }
}

class TamGiac: DaGiac {
    var a: Float, b: Float, c: Float
    
    init(kichThuocCanh: [Float]) {
        self.a = kichThuocCanh[0]
        self.b = kichThuocCanh[1]
        self.c = kichThuocCanh[2]
        super.init(soCanh: 3, kichThuocCanh: kichThuocCanh)
    }
    
    override func tinhChuVi() -> Float {
        return a + b + c
    }
    
    func tinhDienTich() -> Double {
        let p: Float = tinhChuVi() / 2
        let binhPhuong: Float = p * (p - a) * (p - b) * (p - c)
        return sqrt(Double(binhPhuong))
    }
    
    func dlPitago(tamGiac: TamGiac) -> Bool {
        return (tamGiac.a * tamGiac.a + tamGiac.b * tamGiac.b == tamGiac.c * tamGiac.c ||
            tamGiac.b * tamGiac.b + tamGiac.c * tamGiac.c == tamGiac.a * tamGiac.a ||
            tamGiac.a * tamGiac.a + tamGiac.c * tamGiac.c == tamGiac.b * tamGiac.b)
    }
    
    func dsTamGiac(_ mangTG: [TamGiac]) {
        for tamGiac in mangTG where dlPitago(tamGiac: tamGiac) {
            print("\(tamGiac.a) \(tamGiac.b) \(tamGiac.c)")
        }
    }
}

var tamGiac1 = TamGiac(kichThuocCanh: [2.2, 3, 4])
var tamGiac2 = TamGiac(kichThuocCanh: [3, 4, 5])
var mangTamGiac: [TamGiac] = [tamGiac1, tamGiac2]
