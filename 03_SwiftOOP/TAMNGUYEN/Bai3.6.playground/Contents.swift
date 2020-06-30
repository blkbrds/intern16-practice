import UIKit
import Foundation

var pi = Float.pi

class HinhVe {
    
}
class HaiChieu:HinhVe {
    
}
class BaChieu:HinhVe {
    
}
class Tron:HaiChieu {
    var bankinh: Float
    init(r: Float) {
        bankinh = r
    }
    
    func dienTich() -> Float {
        return pi * bankinh * bankinh
    }
    
    func chuVi() -> Float {
        return 2 * pi * bankinh
    }
}
class Vuong:HaiChieu {
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
class TamGiac:HaiChieu {
    var a,b,c: Float
    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    func dienTich() -> Float {
        var nuachuvi = chuVi() / 2
        return 1
        // return sqrt(nuachuvi * (nuachuvi - a) * (nuachuvi - b) * (nuachuvi - c ))
    }
    
    func chuVi() -> Float {
        return a + b + c
    }
}
class Cau:BaChieu {
    // something
}
class LapPhuong:BaChieu {
    // something
}
