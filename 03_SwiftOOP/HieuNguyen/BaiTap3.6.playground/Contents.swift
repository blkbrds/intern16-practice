import UIKit
import Foundation
var pi = Float.pi
class HinhVe {

}

class HaiChieu: HinhVe {
    
}

class BaChieu: HinhVe {

}

class Tron: HaiChieu {
    var banKinh: Float

    init(bk: Float) {
        banKinh = bk
    }

    func dienTich() -> Float {
        return pi * banKinh * banKinh
    }
    
    func chuVi() -> Float {
        return 2 * pi * banKinh
    }
}

class Vuong: HaiChieu {
    var canh: Float

    init(c: Float) {
        canh = c
    }

    func dienTich() -> Float {
        return canh * canh
    }
    
    func chuVi() -> Float {
        return 4 * canh
    }
}

class TamGiac: HaiChieu {
    var a, b, c: Float

    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }

    func dienTich() -> Float {
        let nuaChuVi = self.chuVi() / 2
        return sqrt(nuaChuVi * (nuaChuVi - a) * (nuaChuVi - b) * (nuaChuVi - c))
    }
    
    func chuVi() -> Float {
        return a + b + c
    }
}

class Cau: BaChieu {
    var banKinh: Float
    
    init(bk: Float) {
        banKinh = bk
    }
    
//    func
}

class LapPhuong: BaChieu {

}
