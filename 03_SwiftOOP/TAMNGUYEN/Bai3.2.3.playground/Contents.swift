import UIKit
import Foundation

class DaGiac {
    var soCanh: Int = 0
    var sizeCanh: [Float] = []
    
    
    init(soCanh: Int, sizeCanh: [Float]) {
        self.soCanh = soCanh
        self.sizeCanh = sizeCanh
    }
    
    func kiemTraTamGiac(soCanh: Int, sizeCanh: [Float]) -> Bool {
        return soCanh == sizeCanh.count && sizeCanh[0] > sizeCanh[1] + sizeCanh[2] && sizeCanh[1] > sizeCanh[0] + sizeCanh[2] && sizeCanh[2] > sizeCanh[0] + sizeCanh[1]
    }
    
    func tinhChuVi() -> Float {
        var chuVi: Float = 0
        for index in 0..<sizeCanh.count {
            chuVi += sizeCanh[index]
        }
        return chuVi
    }
    
    func printSize() {
        for index in 0..<sizeCanh.count {
            print(sizeCanh[index])
        }
    }
    
}
var dagiac = DaGiac(soCanh: 5, sizeCanh: [1,2,3,4,5])
dagiac.tinhChuVi()

class TamGiac: DaGiac {
    override func tinhChuVi() -> Float {
        var chuVi: Float = 0
        for index in 0..<sizeCanh.count {
            chuVi += sizeCanh[index]
        }
        return chuVi
        
    }
    
    func dienTich() -> Float {
        let nuaChuVi = tinhChuVi() / 2
        return sqrt(nuaChuVi * nuaChuVi - sizeCanh[0] * nuaChuVi - sizeCanh[1] * nuaChuVi - sizeCanh[2])
    }
}
var tamgiac = TamGiac(soCanh: 3,sizeCanh: [2,1,3] )

tamgiac.kiemTraTamGiac(soCanh: 3, sizeCanh: [2,3,1])
tamgiac.dienTich()
tamgiac.tinhChuVi()
print("Dien tich cua tam giac la : \(tamgiac.dienTich())")
