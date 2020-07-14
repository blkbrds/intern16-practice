import UIKit

protocol HinhVe {
    func dienTich() -> Float
}

protocol Hinh2Chieu: HinhVe {
    func chuVi() -> Float
}
protocol Hinh3Chieu: HinhVe {
    func theTich() -> Float
}

class HinhTron: Hinh2Chieu {
    
    var r: Float = 0
    
    init(r: Float) {
        self.r = r
    }
    
    func chuVi() -> Float {
        return r * 2 * Float.pi
    }
    func dienTich() -> Float {
        return Float.pi * powf(r, 2)
    }
}

class HinhVuong: Hinh2Chieu {
    var a: Float = 0
    
    init(a: Float) {
        self.a = a
    }
    
    func chuVi() -> Float {
        return a * 4
    }
    func dienTich() -> Float {
        return powf(a, 2)
    }
}
class HinhTamGiac: Hinh2Chieu {
    var a: Float = 0
    var b: Float = 0
    var c: Float = 0
    
    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    func chuVi() -> Float {
        return a + b + c
    }
    func dienTich() -> Float {
        let p = (a + b + c) / 2
        return sqrtf(p * (p - a) * (p - b) * (p - c))
    }
}
class HinhCau: Hinh3Chieu {
    var r: Float = 0
       
    init(r: Float) {
           self.r = r
    }
    func theTich() -> Float {
        return 4 * Float.pi * powf(r, 3) / 3
    }
    func dienTich() -> Float {
        return 4 * Float.pi * powf(r, 2)
    }
}

class LapPhuong: Hinh3Chieu {
    var a: Float = 0
       
    init(a: Float) {
           self.a = a
    }
    func theTich() -> Float {
        return powf(a, 3)
    }
    func dienTich() -> Float {
        return 6 * a
    }
}

let b = HinhCau(r: 4)
b.dienTich()
b.theTich()

let c = HinhTamGiac(a: 3, b: 4, c: 5)
c.chuVi()



