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
}

var daGiac = DaGiac(soCanh: 5, kichThuocCanh: [1.2, 2, 4, 6.1, 5.9])
var tamGiac = TamGiac(kichThuocCanh: [2, 3, 4])
print(tamGiac.tinhChuVi())
print(tamGiac.tinhDienTich())
