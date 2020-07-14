import Foundation

class DaGiac {
    var soCanh: Int = 0
    var kichThuoc: [Int] = []

    enum enumCheckDaGiac {
        case invalid
        case khacnhau
        case bangnhau(Int, [Int])
    }

    func checkDaGiac(soCanh: Int, kichThuoc: [Int]) -> enumCheckDaGiac {
        if soCanh == 0 || kichThuoc == [] {
            return .invalid
        } else if soCanh != kichThuoc.count {
            return .khacnhau
        } else {
            return .bangnhau(soCanh, kichThuoc)
        }
    }

    init(soCanh: Int, kichThuoc: [Int]) {
        let kiemtra = checkDaGiac(soCanh: soCanh, kichThuoc: kichThuoc)
        switch kiemtra {
        case .invalid:
            print("Error: Nhập số cạnh bằng 0 hoặc array rỗng.")
            self.kichThuoc = []
            self.soCanh = 0
        case .khacnhau:
            print("Error: Nhập số cạnh và array không bằng nhau.")
            self.kichThuoc = []
            self.soCanh = 0
        case .bangnhau(let socanh, let kichthuoc):
            self.kichThuoc = kichthuoc
            self.soCanh = socanh
        }
    }

    func ChuVi() -> Int {
        var CV: Int = 0
        for i in 0..<self.soCanh {
            CV = CV + self.kichThuoc[i]
        }
        return CV
    }

    func InCanh() {
        print("\nCác cạnh của đa giác có kích thước là")
        for i in 0..<self.soCanh {
            print(self.kichThuoc[i])
        }
    }
}

let dg = DaGiac(soCanh: 5, kichThuoc: [2, 5, 8, 6, 16])

print("Chu vi của đa giác là: \(dg.ChuVi())")
dg.InCanh()
