import Foundation

class HinhVe {
    var chuVi: Float = 0.0
    var dienTich: Float = 0.0

    func tinhChuVi() -> Float {
        return Float(chuVi)
    }

    func tinhDienTich() -> Float {
        return Float(dienTich)
    }
}
// Class 2 chieu
class HaiChieu: HinhVe {
}

// Class 3 chieu
class BaChieu: HinhVe {
    var theTich: Float = 0.0

    func tinhTheTich() -> Float {
        return theTich
    }
}

class HinhTron: HaiChieu {
    var banKinh: Float

    init(banKinh: Float) {
        self.banKinh = banKinh
    }

    override func tinhChuVi() -> Float {
        chuVi = 2 * banKinh * Float.pi
        return chuVi
    }

    override func tinhDienTich() -> Float {
        dienTich = banKinh * banKinh * Float.pi
        return dienTich
    }
}

class HinhVuong: HaiChieu {
    var canh: Int

    init(canh: Int) {
        self.canh = canh
    }

    override func tinhChuVi() -> Float {
        chuVi = Float(canh * 4)
        return chuVi
    }

    override func tinhDienTich() -> Float {
        dienTich = Float(canh * canh)
        return dienTich
    }
}

class HinhCN: HaiChieu {
    var dai: Int
    var rong: Int

    init(dai: Int, rong: Int) {
        self.dai = dai
        self.rong = rong
    }

    override func tinhChuVi() -> Float {
        chuVi = Float(2 * (dai + rong))
        return chuVi
    }

    override func tinhDienTich() -> Float {
        dienTich = Float(dai * rong)
        return dienTich
    }
}

class HinhCau: BaChieu {
    var banKinh: Float

    init(banKinh: Float) {
        self.banKinh = banKinh
    }

    override func tinhDienTich() -> Float {
        dienTich = 4 * Float.pi * banKinh * banKinh
        return dienTich
    }

    override func tinhTheTich() -> Float {
        theTich = 4 / 3 * Float.pi * banKinh * banKinh * banKinh
        return theTich
    }
}

class HinhLapPhuong: BaChieu {
    var canh: Float

    init(canh: Float) {
        self.canh = canh
    }

    override func tinhDienTich() -> Float {
        dienTich = 6 * canh * canh
        return dienTich
    }

    override func tinhTheTich() -> Float {
        theTich = canh * canh * canh
        return theTich
    }
}
