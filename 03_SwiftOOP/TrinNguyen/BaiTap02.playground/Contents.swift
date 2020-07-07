import Foundation

class DaGiac {
    var canh: Int
    var arrayCanh = [Int]()

    init?(canh: Int, arrayCanh: [Int]) {
        if canh == arrayCanh.count {
            self.canh = canh
            self.arrayCanh = arrayCanh
        } else {
            return nil
        }
    }

    func tinhChuVi() -> Int {
        var chuVi = 0
        for canh in 0..<arrayCanh.count {
            chuVi += arrayCanh[canh]
        }
        return chuVi
    }

    func inCanh() -> Int {
        for canh in 0..<arrayCanh.count {
            print("Cac canh cua da giac la: \(arrayCanh[canh])")
        }
        return canh
    }
}

if let daGiac = DaGiac(canh: 3, arrayCanh: [8, 6, 12]) {
    print("Chu vi cua da giac la: \(daGiac.tinhChuVi())")
    daGiac.inCanh()
} else {
    print("Nhap sai vui long nhap lai")
}

// Bai3
class TamGiac: DaGiac {
    // Override lai de tinh dien tich
    override init?(canh: Int, arrayCanh: [Int]) {
        super.init(canh: canh, arrayCanh: arrayCanh)
        let check = checkTamGiac(canh: canh, arrayCanh: arrayCanh)
        if !check {
            return nil
        }
    }

    func checkTamGiac(canh: Int, arrayCanh: [Int]) -> Bool {
        if canh == arrayCanh.count && arrayCanh[0] + arrayCanh[1] > arrayCanh[2] && arrayCanh[1] + arrayCanh [2] > arrayCanh[0] && arrayCanh[0] + arrayCanh [2] > arrayCanh[1] {
            return true
        }
        return false
    }

    func tinhChuVi() -> Float {
        Float(super.tinhChuVi())
    }

    func tinhDienTich() -> Float {
        var dienTich: Float = 0.0
        let p: Float = self.tinhChuVi() / 2
        let temp: Float = p * (p - Float(arrayCanh[0])) * (p - Float(arrayCanh[1])) * (p - Float(arrayCanh[2]))
        dienTich = sqrt(temp)
        return dienTich
    }
}

if let tamGiac = TamGiac(canh: 3, arrayCanh: [8, 4, 13]) {
    print("Dien tich cua tam giac la: \(tamGiac.tinhDienTich())")
} else {
    print("Nhap sai vui long nhap lai")
}
