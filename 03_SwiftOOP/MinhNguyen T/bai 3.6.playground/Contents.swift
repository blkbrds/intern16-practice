import Foundation
// Xây dưng lớp hinh vẽ : chu vi và dien tich
class HinhVe {
    var chuvi: Float = 0.0
    var dientich: Float = 0.0
    
    func chuVi() -> Float {
        return chuvi
    }
    func dienTich() -> Float {
        return dientich
    }
    
}

// Xây dựng lớp hai chiều kế thừa lớp hình vẽ
class HaiChieu : HinhVe{
    
}

// Xây dựng lớp ba chiều kế thừa lớp hình vẽ
class baChieu : HinhVe {
    var thetich: Float = 0.0
    func theTich() -> Float {
        return thetich
    }
}

// Lớp hình tron kế thừa lớp 2 chìu
class Tron : HaiChieu{
    var banKinh: Float
    
    init(bk: Float) {
        self.banKinh = bk
        super.init()
    }
    
    override func chuVi() -> Float {
        self.chuvi = Float.pi * 2 * banKinh
        return self.chuvi
    }
    
    override func dienTich() -> Float {
        self.dientich = Float.pi * banKinh * banKinh
        return self.dientich
    }
}

//Lớp hình vuong kế thừa lớp 2 chìu

class Vuong: HaiChieu {
    var canh: Float
    
    init(canh: Float) {
        self.canh = canh
        super.init()
    }
    
    override func chuVi() -> Float {
        self.chuvi = 4 * canh
        return self.chuvi
    }
    
    override func dienTich() -> Float {
        self.dientich = canh * canh
        return self.dientich
    }
}
//Lớp hình tam giac kế thừa lớp 2 chìu

class TamGiac: HaiChieu {
    var canh1: Float
    var canh2: Float
    var canh3: Float
    
    init(canh1:Float, canh2: Float, canh3: Float) {
        self.canh1 = canh1
        self.canh2 = canh2
        self.canh3 = canh3
        super.init()
    }
    
    override func chuVi() -> Float {
        self.chuvi = canh1 + canh2 + canh3
        return self.chuvi
    }
    
    override func dienTich() -> Float {
        let p = (canh1 + canh2 + canh3) * (canh1 + canh2 - canh3) * (canh1 + canh3 - canh2)
        self.dientich = sqrt(p)/4
        return self.dientich
    }
}
//Lớp hình cau kế thừa lớp 3 chìu
class Cau : baChieu{
    var bankinh: Float
    
    init(bankinh: Float) {
        self.bankinh = bankinh
        super.init()
    }
    
    override func dienTich() -> Float {
        self.dientich = 4 * .pi * bankinh * bankinh
        return self.dientich
    }
    
    override func theTich() -> Float {
        self.thetich = self.dientich * bankinh / 3
        return self.thetich
    }
}
// Lớp hình lap phuong kế thừa lớp 3 chìu
class LapPhuong : baChieu{
    var a: Float
    
    init(a: Float) {
        self.a = a
        super.init()
    }
    
    override func dienTich() -> Float {
        self.dientich = 6 * a * a
        return self.dientich
    }
    
    override func theTich() -> Float {
        self.thetich = a * a * a
        return self.thetich
    }
}

let hinhve = HinhVe()

Tron.init(bk: 2).chuVi()
