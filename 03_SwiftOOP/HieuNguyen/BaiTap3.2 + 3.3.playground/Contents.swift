import UIKit
import Foundation

print("Bai tap 2")
class DaGiac {
    var SoCanh: Int
    var KichThuoc: [Float]
    init(soCanh: Int,kichThuoc: [Float]) {
        self.SoCanh = soCanh
        self.KichThuoc = kichThuoc
    }
    func chuVi() -> Float {
        var chuVi:Float = 0
        for canh in self.KichThuoc {
            chuVi += canh
        }
        return chuVi
    }
    func inGiaTri() -> String {
        var giaTri:String = ""
        for canh in self.KichThuoc {
            giaTri += "\(canh), "
        }
        return giaTri
    }
}
var daGiac = DaGiac(soCanh: 5, kichThuoc: [3.5,5,4.5,6,10])
print("Chu vi: \(daGiac.chuVi())")
print("Gia tri cac canh: \(daGiac.inGiaTri())")


print("---------")
print("Bai tap 3")
class TamGiac: DaGiac {
    override func chuVi() -> Float {
        return self.KichThuoc.reduce(0, +)
    }
    // cong thuc heron
    func dienTich() -> Float {
        let nuaChuvi = self.chuVi() / 2
        return sqrt(nuaChuvi * (nuaChuvi - self.KichThuoc[0]) * (nuaChuvi - self.KichThuoc[1]) * (nuaChuvi - self.KichThuoc[2]) )
    }
}
var tamGiac = TamGiac(soCanh: 3, kichThuoc: [3,4,5])
print("Chu vi tam giac : \(tamGiac.chuVi())")
print("Dien tich tam giac : \(tamGiac.dienTich())")

print("---------")
print("Bai tap 4")

