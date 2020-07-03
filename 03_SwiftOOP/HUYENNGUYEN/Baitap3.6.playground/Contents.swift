import UIKit

class HinhVe {
    var chuVi: Double = 0
    var dienTich: Double = 0
}

class HaiChieu: HinhVe { }

class HinhTron: HaiChieu {
    var banKinh: Double
    init(_ banKinh: Double) {
        self.banKinh = banKinh
        super.init()
        self.chuVi = 2 * .pi * banKinh
        self.dienTich = .pi * banKinh * banKinh
    }
}

class HinhVuong: HaiChieu {
    var canh: Double
    init(_ canh: Double) {
        self.canh = canh
        super.init()
        self.chuVi = canh * 4
        self.dienTich = canh * canh
    }
}

class HinhTamGiac: HaiChieu {
    var canhA: Double
    var canhB: Double
    var canhC: Double
    
    init(_ canhA: Double,_ canhB: Double,_ canhC: Double) {
        self.canhA = canhA
        self.canhB = canhB
        self.canhC = canhC
        super.init()
        self.chuVi = canhA + canhB + canhC
        self.dienTich = sqrt((canhA + canhB + canhC) * (canhA + canhB - canhC) * (canhC + canhA - canhB)) / 4
    }
}

class BaChieu: HinhVe {
    var theTich: Double = 0
}

class HinhCau: BaChieu {
    var banKinh: Double
    init(_ banKinh: Double) {
        self.banKinh = banKinh
        super.init()
        self.theTich = 4 * .pi * banKinh * banKinh * banKinh / 3
    }
}

class HinhLapPhuong: BaChieu {
    var canh: Double
    init(_ canh: Double) {
        self.canh = canh
        super.init()
        self.theTich = canh * canh * canh
    }
}

let hinhTron: HinhTron = HinhTron(1)
print("Chu vi hình tròn: \(hinhTron.chuVi)")
print("Diện tích hình tròn: \(hinhTron.dienTich)")

let hinhVuong: HinhVuong = HinhVuong(2)
print("Chu vi hình vuông: \(hinhVuong.chuVi)")
print("Diện tích hình vuông: \(hinhVuong.dienTich)")

let hinhTamGiac: HinhTamGiac = HinhTamGiac(3, 4, 5)
print("Chu vi hình tam giác: \(hinhTamGiac.chuVi)")
print("Diện tích hình tam giác: \(hinhTamGiac.dienTich)")

let hinhCau: HinhCau = HinhCau(6)
print("Thể tích hình cầu: \(hinhCau.theTich)")

let hinhLapPhuong: HinhLapPhuong = HinhLapPhuong(7)
print("Thể tích hình lập phương: \(hinhLapPhuong.theTich)")
