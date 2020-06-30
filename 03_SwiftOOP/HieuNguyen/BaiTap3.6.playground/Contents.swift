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
        self.dienTich = pi * pow(banKinh, 2)
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

print(Tron.init(bk: 15).dienTich)
print(Tron.init(bk: 15).chuVi)

print(Vuong.init(c: 10).chuVi)
print(Vuong.init(c: 10).dienTich)

print(TamGiac.init(a: 5, b: 3, c: 4).chuVi)
print(TamGiac.init(a: 5, b: 3, c: 4).dienTich)

print(Cau.init(bk: 10).dienTich)
print(Cau.init(bk: 10).theTich)

print(LapPhuong.init(canh: 10).dienTich)
print(LapPhuong.init(canh: 10).theTich)
