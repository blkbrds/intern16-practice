import UIKit

class HinhVe {
    var chuVi = 0.0
    var dienTich = 0.0
//    var canh: Int
//    var arrayCanh = [Int]()
//
//    init(canh: Int,arrayCanh: [Int]) {
//        self.canh = canh
//        self.arrayCanh = arrayCanh
//    }
    func tinhChuVi() -> Float {
////        for canh in 0..<arrayCanh.count{
////            chuVi += arrayCanh[canh]
////        }
        return Float(chuVi)
    }
    func tinhDienTich() -> Float {
//        for canh in 0..<arrayCanh.count{
//            dienTich *= arrayCanh[canh]
//        }
        return Float(dienTich)
    }
    //class 2 chieu
    class HaiChieu: HinhVe {
    }
    //class 3 chieu
    class BaChieu: HinhVe {
        var theTich = 0.0
        func tinhTheTich() -> Float {
            return Float(theTich)
        }
    }
    //class hinh tron
    class HinhTron: HaiChieu {
        var banKinh: Float
        init(banKinh: Float) {
            self.banKinh = banKinh
        }
        override func tinhChuVi() -> Float {
            chuVi = Double(2 * banKinh * Float.pi)
            return Float(chuVi)
        }
        override func tinhDienTich() -> Float {
            dienTich = Double(banKinh * banKinh * Float.pi)
            return Float(dienTich)
        }
    }
    class HinhVuong: HaiChieu {
        var canh: Int
        init(canh: Int) {
            self.canh = canh
        }
        override func tinhChuVi() -> Float {
            chuVi = Double(canh * 4)
            return Float(chuVi)
        }
        override func tinhDienTich() -> Float {
            dienTich = Double(canh * canh)
            return Float(dienTich)
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
            chuVi = Double(2 * (dai + rong))
            return Float(chuVi)
        }
        override func tinhDienTich() -> Float {
            dienTich = 	Double(dai * rong)
            return Float(dienTich)
        }
    }
    class HinhCau: BaChieu {
        var banKinh: Float
        init(banKinh: Float) {
            self.banKinh = banKinh
        }
        override func tinhDienTich() -> Float {
            dienTich = Double(4 * Float.pi * banKinh * banKinh)
            return Float(dienTich)
        }
        override func tinhTheTich() -> Float {
            theTich = Double(4/3 * Float.pi * banKinh * banKinh * banKinh)
            return Float(theTich)
        }
    }
    class HinhLapPhuong: BaChieu {
        var canh: Float
        init(canh: Float) {
            self.canh = canh
        }
        override func tinhDienTich() -> Float {
            dienTich = Double(6 * canh * canh)
            return Float(dienTich)
        }
        override func tinhTheTich() -> Float {
            theTich = Double(canh * canh * canh)
            return Float(theTich)
        }
        
    }

}
