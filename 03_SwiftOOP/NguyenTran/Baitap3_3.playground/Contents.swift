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

    init?(soCanh: Int, kichThuoc: [Int]) {
        let kiemtra = checkDaGiac(soCanh: soCanh, kichThuoc: kichThuoc)
        switch kiemtra {
        case .invalid:
            return nil
        case .khacnhau:
            return nil
        case .bangnhau(let socanh, let kichthuoc):
            self.kichThuoc = kichthuoc
            self.soCanh = socanh
        }
    }

    func chuVi() -> Int {
        var CV: Int = 0
        for i in 0..<self.soCanh {
            CV = CV + self.kichThuoc[i]
        }
        return CV
    }

    func inCanh() {
        print("\nCác cạnh của đa giác có kích thước là")
        for i in 0..<self.soCanh {
            print(self.kichThuoc[i])
        }
    }
}

class TamGiac: DaGiac {

    func checkTamGiac(a: Int, b: Int, c: Int) -> Bool {
        if (a >= b + c || b >= a + c || c >= a + b) {
            return false
        } else {
            return true
        }
    }

    init?(KT_tamgiac: [Int]) {
        super.init(soCanh: 3, kichThuoc: KT_tamgiac)
        if checkTamGiac(a: super.kichThuoc[0], b: super.kichThuoc[1], c: super.kichThuoc[2]) == false {
            return nil
        }
    }

    override func chuVi() -> Int {
        return self.kichThuoc[0] + self.kichThuoc[1] + self.kichThuoc[2]
    }

    func dienTich() -> Float {
        let p = Float(chuVi()) / Float(2)
        var DT = p
        for i in self.kichThuoc {
            DT = DT * (p - Float(i))
        }
        return sqrt(DT)
    }
}

if let tg = TamGiac(KT_tamgiac: [3, 4, 5]) {
    print("Chu vi tam giác là \(tg.chuVi())")
    print("Diện tích tam giác là \(tg.dienTich())")
    tg.inCanh()
} else {
    print("Thông tin input không chính xác, không thể tính toán chu vi và diện tích.")
}
