import Foundation

var pi = Float.pi

class HinhVe {
    var chuVi: Float?
    var dienTich: Float?
}

class HaiChieu: HinhVe {

}

class BaChieu: HinhVe {
    var theTich: Float?
}

class Tron: HaiChieu {
    var banKinh: Float

    init(bk: Float) {
        banKinh = bk
        super.init()
        self.chuVi = 2 * pi * banKinh
        self.dienTich = 2 * pi * banKinh
    }
}

class Vuong: HaiChieu {
    var canh: Float

    init(c: Float) {
        canh = c
        super.init()
        self.chuVi = 4 * canh
        self.dienTich = canh * canh
    }
}

class TamGiac: HaiChieu {
    var a, b, c: Float

    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
        super.init()
        self.chuVi = a + b + c
        let nuaChuVi = chuVi! / 2
        self.dienTich = sqrt(nuaChuVi * (nuaChuVi - a) * (nuaChuVi - b) * (nuaChuVi - c))
    }
}

class Cau: BaChieu {
    var banKinh: Float

    init(bk: Float) {
        banKinh = bk
        super.init()
        self.dienTich = 4 * pi * banKinh * banKinh
        self.theTich = 4 / 3 * pi * pow(banKinh, 3)
    }
}

class LapPhuong: BaChieu {
    var canh: Float

    init(canh: Float) {
        self.canh = canh
        super.init()
        self.dienTich = 6 * pow(canh, 2)
        self.theTich = pow(canh, 3)
    }
}
