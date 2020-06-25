import UIKit
import Foundation

class PhanSo {
    var tuSo: Int
    var mauSo: Int
    
    init(tuSo: Int,mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    func xuat () -> String{
        return "\(tuSo) / \(mauSo)"
    }
    func cong (ps: PhanSo) -> PhanSo{
        let tuSo = self.tuSo * ps.mauSo + self.mauSo * ps.tuSo
        let mauSo = self.mauSo * ps.mauSo
        return PhanSo.init(tuSo: tuSo, mauSo: mauSo)
    }
    func tru (ps: PhanSo) -> PhanSo{
        let tuSo = self.tuSo * ps.mauSo - self.mauSo * ps.tuSo
        let mauSo = self.mauSo * ps.mauSo
        return PhanSo.init(tuSo: tuSo, mauSo: mauSo)
    }
    func nhan (ps: PhanSo) -> PhanSo{
        let tuSo = self.tuSo * ps.tuSo
        let mauSo = self.mauSo * ps.mauSo
        return PhanSo.init(tuSo: tuSo, mauSo: mauSo)
    }
    func chia (ps: PhanSo) -> PhanSo{
        let tuSo = self.tuSo * ps.mauSo
        let mauSo = self.mauSo * ps.tuSo
        return PhanSo.init(tuSo: tuSo, mauSo: mauSo)
    }
}
var phanSo1 = PhanSo.init(tuSo: 3, mauSo: 5)
var phanSo2 = PhanSo.init(tuSo: 5, mauSo: 8)

print("Phan so 1: \(phanSo1.xuat())")
print("Phan so 2: \(phanSo2.xuat())")

var kqCong = phanSo1.cong(ps: phanSo2)
var kqTru  = phanSo1.tru(ps: phanSo2)
var kqNhan = phanSo1.nhan(ps: phanSo2)
var kqChia = phanSo1.chia(ps: phanSo2)

print("KQ phep cong : \(kqCong.xuat())")
print("KQ phep tru  : \(kqTru.xuat())")
print("KQ phep nhan : \(kqNhan.xuat())")
print("KQ phep chia : \(kqChia.xuat())")
