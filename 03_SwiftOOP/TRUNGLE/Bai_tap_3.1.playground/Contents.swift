import UIKit
import Foundation
class PhanSo {
    var tuSo: Double
    var mauSo:  Double
    init(tuSo: Double, mauSo: Double) {
        self.tuSo = tuSo
        if mauSo == 0 {
            print("mau so phai khac 0")
            
        }
        self.mauSo = mauSo
    }
    func UCLN ( no1 : Double, no2 : Double ) -> Double {
        var a = abs(no1)
        var b = abs(no2)
        if a == 0 && b == 0 {
            return 0
        } else {
            while a != b {
                if a > b {
                 a -= b
                } else {
                   b -= a
                }
            }
        }
        return a
    }
    func congPhanSo (a : PhanSo) -> PhanSo {
        let tuSo = self.tuSo * a.mauSo + self.mauSo * a.tuSo
        let mauSo = self.mauSo * a.mauSo
        return PhanSo ( tuSo: tuSo, mauSo: mauSo)
    }
    func truPhanSo ( a: PhanSo) -> PhanSo {
        let tuSo = self.tuSo * a.mauSo - self.mauSo * a.tuSo
        let mauSo = self.mauSo * a.mauSo
        return PhanSo (tuSo: tuSo, mauSo: mauSo)
    }
    func nhanPhanSo ( a: PhanSo) -> PhanSo {
        let tuSo = self.tuSo * a.tuSo
        let mauSo = self.mauSo * a.mauSo
        return PhanSo ( tuSo: tuSo, mauSo: mauSo)
    }
    func chiaPhanSo ( a: PhanSo) -> PhanSo {
        let tuSo = self.tuSo * a.mauSo
        let mauSo = self.mauSo * a.tuSo
        return PhanSo ( tuSo: tuSo, mauSo: mauSo)
    }
    func inPS(){
        print("\(tuSo / UCLN(no1: tuSo, no2: mauSo ))/\(mauSo / UCLN(no1: tuSo, no2: mauSo))")
        
    }
}
var ps1 = PhanSo(tuSo: 1, mauSo: 2)
var ps2 = PhanSo(tuSo: 1, mauSo: 0)
var kqCong = ps1.congPhanSo(a: ps2)
var kqTru  = ps1.truPhanSo(a:ps2)
var kqNhan = ps1.nhanPhanSo(a:ps2)
var kqChia = ps1.chiaPhanSo(a:ps2)
kqCong.inPS()
//kqTru.inPS()
//kqNhan.inPS()
//kqChia.inPS()


