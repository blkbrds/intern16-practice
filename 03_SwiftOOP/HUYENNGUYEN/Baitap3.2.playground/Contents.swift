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

var daGiac = DaGiac(soCanh: 5, kichThuocCanh: [1.2, 2, 4, 6.1, 5.9])
print(daGiac.tinhChuVi())
print(daGiac.inGiaTri())
