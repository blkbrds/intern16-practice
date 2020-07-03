import Foundation

class DaGiac {
    var canh: Int
    var arrayCanh = [Int]()

    init(canh: Int, arrayCanh: [Int]) {
        self.canh = canh
        self.arrayCanh = arrayCanh
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

// Bai3
class TamGiac: DaGiac {
    // Override lai de tinh dien tich
    override func tinhChuVi() -> Int {
        var dienTich = 0
        dienTich = (arrayCanh[0] + arrayCanh[1]) / 2
        return dienTich
    }
}

let tamGiac = TamGiac(canh: 2, arrayCanh: [2, 2])
print("Dien tich cua tam giac la: \(tamGiac.tinhChuVi())")

let daGiac = DaGiac(canh: 3, arrayCanh: [1, 2, 3])
print("Chu vi cua da giac la: \(daGiac.tinhChuVi())")
daGiac.inCanh()
