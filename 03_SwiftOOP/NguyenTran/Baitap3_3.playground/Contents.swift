import UIKit
import Foundation

class DaGiac {
    var SoCanh: Int = 0
    var KichThuoc: [Int] = []

    enum check {
        case invalid
        case khacnhau
        case bangnhau(Int, [Int])
    }

    func checkDaGiac(SoCanh: Int, KichThuoc: [Int]) -> check {
        if SoCanh == 0 || KichThuoc == [] {
            return .invalid
        } else if SoCanh != KichThuoc.count {
            return .khacnhau
        } else {
            return .bangnhau(SoCanh, KichThuoc)
        }
    }

    init(SoCanh: Int, KichThuoc: [Int]) {
        let kiemtra = checkDaGiac(SoCanh: SoCanh, KichThuoc: KichThuoc)
        switch kiemtra {
        case .invalid:
            print("Error: Nhập số cạnh bằng 0 hoặc array rỗng.")
            self.KichThuoc = []
            self.SoCanh = 0
        case .khacnhau:
            print("Error: Nhập số cạnh và array không bằng nhau.")
            self.KichThuoc = []
            self.SoCanh = 0
        case .bangnhau(let socanh, let kichthuoc):
            self.KichThuoc = kichthuoc
            self.SoCanh = socanh
        }
    }

    func ChuVi() -> Int {
        var CV: Int = 0
        for i in 0..<self.SoCanh {
            CV = CV + self.KichThuoc[i]
        }
        return CV
    }

    func InCanh() {
        print("\nCác cạnh của đa giác có kích thước là")
        for i in 0..<self.SoCanh {
            print(self.KichThuoc[i])
        }
    }
}

class TamGiac: DaGiac {

    func check_tamgiac(a: Int, b: Int, c: Int) -> Bool {
        if (a >= b + c || b >= a + c || c >= a + b) {
            return false
        } else {
            return true
        }
    }

    init(KT_tamgiac: [Int]) {
        super.init(SoCanh: 3, KichThuoc: KT_tamgiac)
        if check_tamgiac(a: super.KichThuoc[0], b: super.KichThuoc[1], c: super.KichThuoc[2]) == false {
            print("Đây không phải là 3 cạnh của tam giác.")
            self.KichThuoc = []
        }
    }

    override func ChuVi() -> Int {
        return self.KichThuoc[0] + self.KichThuoc[1] + self.KichThuoc[2]
    }

    func DienTich() -> Float {
        let p = Float(ChuVi()) / Float(2)
        var DT = p
        for i in self.KichThuoc {
            DT = DT * (p - Float(i))
        }
        return sqrt(DT)
    }
}

let tg = TamGiac(KT_tamgiac: [1, 2, 2])

if(tg.KichThuoc == []) {
    print("Không thể tính toán chu vi và diện tích.")
} else {
    print("Chu vi tam giác là \(tg.ChuVi())")
    print("Diện tích tam giác là \(tg.DienTich())")
}
