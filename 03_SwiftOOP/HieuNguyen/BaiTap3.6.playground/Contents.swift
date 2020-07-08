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
        chuVi = 2 * pi * banKinh
        dienTich = pi * pow(banKinh, 2)
    }
}

class Vuong: HaiChieu {
    var canh: Float

    init(c: Float) {
        canh = c
        super.init()
        chuVi = 4 * canh
        dienTich = canh * canh
    }
}

class TamGiac: HaiChieu {
    var a, b, c: Float

    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
        super.init()
        chuVi = a + b + c
        if let chuVi = chuVi {
            let nuaChuVi = chuVi / 2
            dienTich = sqrt(nuaChuVi * (nuaChuVi - a) * (nuaChuVi - b) * (nuaChuVi - c))
        }
    }
}

class Cau: BaChieu {
    var banKinh: Float

    init(bk: Float) {
        banKinh = bk
        super.init()
        dienTich = 4 * pi * banKinh * banKinh
        theTich = 4 / 3 * pi * pow(banKinh, 3)
    }
}

class LapPhuong: BaChieu {
    var canh: Float

    init(canh: Float) {
        self.canh = canh
        super.init()
        dienTich = 6 * pow(canh, 2)
        theTich = pow(canh, 3)
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
