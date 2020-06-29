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

let dg = DaGiac(SoCanh: 5, KichThuoc: [2,5,8,6,16])

print("Chu vi của đa giác là: \(dg.ChuVi())")
dg.InCanh()
