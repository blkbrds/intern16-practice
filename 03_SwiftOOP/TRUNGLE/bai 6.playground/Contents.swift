import UIKit
// MARK: HINH VE
class HinhVe {
    let pi = Double.pi
    var a : Double
    var b : Double
    
    init(a: Double, b: Double) {
        self.a = a
        self.b = b
    }
    func hinhDang() {
        print("Hinh ve sai")
    }
}
    class HaiChieu : HinhVe {
        override init(a: Double, b: Double) {
            super.init(a: a, b : b)
        }
        func chuVi() -> Double{
            return a + b
        }
        func dienTich() -> Double {
            return a * b
        }
    }
// MARK: HINH TRON
class HinhTron : HaiChieu {
    var r : Double
     init(a: Double, b: Double, r: Double) {
           self.r = r
           super.init(a: a, b: b)
       }
    override func hinhDang() {
        print("day la hinh tron")
    }
    override func chuVi() -> Double {
        return 2 * r * pi
    }
    override func dienTich() -> Double {
        return pow(r, 2) * pi
    }
}
// MARK: HINH VUONG
class HinhVuong : HaiChieu {
    override init(a: Double, b: Double) {
        super.init(a: a, b: b)
    }
    override func hinhDang() {
        print("day la Hinh vuong")
    }
    override func chuVi() -> Double {
        return (a + b) * 2
    }
    override func dienTich() -> Double {
        return a * b
    }
    
}
// MARK: HINH TAM GIAC
class TamGiac : HaiChieu {
    var c : Double
    
     init(c: Double, a: Double, b: Double) {
        self.c = c
        super.init(a: a, b: b)
    }
    override func hinhDang() {
        print("day la Tam Giac")
    }
    override func chuVi() -> Double {
        return a + b + c
    }
    override func dienTich() -> Double {
        let h = ( a + b + c ) / 2
        return sqrt(h * ( h - a) * ( h - b  ) * (h - c))
    }
}

// MARK: BA CHIEU
class BaChieu : HinhVe {
    var c : Double
    init(c: Double, a: Double, b: Double) {
        self.c = c
        super.init(a: a, b: b)
    }
    func dienTich()  -> Double{
        return a * b * c
    }
    func theTich() -> Double {
        return pow(a, 2 ) * pow(b, 2)  * pow(c, 2)
    }
}
// MARK: HINH CAU
class HinhCau : BaChieu {
    var r : Double
    init(r: Double, c: Double, a: Double, b: Double) {
        self.r = r
        super.init(c: c, a: a, b: b)
    }
    override func hinhDang() {
        print("Day La Hinh Cau")
    }
    override func dienTich() -> Double {
        return 4 * pi * pow(r, 2)
    }
    override func theTich() -> Double {
       return 4/3 * pi * pow(r, 3)
    }
}

// MARK: HINH LAP PHUONG
class LapPhuong: BaChieu {
    override init(c: Double, a: Double, b: Double) {
        super.init(c: c, a: a, b: b)
    }
    override func hinhDang() {
        print("Day La Hinh Lap Phuong")
    }
    override func dienTich() -> Double {
        return 6  * pow(a, 2)
    }
    override func theTich() -> Double {
        return pow(a, 3)
    }
    func dienTichXungQuanh() -> Double {
        return 4 * pow(a, 2)
    }
}

var tamgiac = TamGiac(c: 4, a: 6, b: 6)
print("chu vi tam giac: \(tamgiac.chuVi())")
print("dien tich tam giac: \(tamgiac.dienTich())")

var vuong = HinhVuong(a: 10, b: 10)
print("chu vi hinh vuong: \(vuong.chuVi())")
print("dien tich hinh vuong: \(vuong.dienTich())")

var tron = HinhTron(a: 0, b: 0, r: 5)
print("chu vi hinh tron: \(tron.chuVi())")
print("dien tich hinh tron: \(tron.dienTich())")

var hinhCau = HinhCau(r: 5, c:0, a: 0, b: 0)
print("dien tich hinh cau: \(hinhCau.dienTich())")
print("the tich hinh cau: \(hinhCau.theTich())")

var lapPhuong = LapPhuong(c: 5, a: 5, b: 5)
print("dien tich toan phan hinh lap phuong: \(lapPhuong.dienTich())")
print("the tich hinh lap phuong: \(lapPhuong.theTich())")
print("dien tich xung quanh hinh lap Phuong : \(lapPhuong.dienTichXungQuanh())")
