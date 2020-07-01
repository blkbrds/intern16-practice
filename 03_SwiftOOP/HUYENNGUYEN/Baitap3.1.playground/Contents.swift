import UIKit

class PhanSo {
    var tuSo: Int
    var mauSo: Int
    
    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    
    func inManHinh() -> String {
        return "\(self.tuSo)/\(self.mauSo)"
    }
    
    func tinhCong(a: PhanSo!) -> PhanSo? {
        let tuMoi: Int
        let mauMoi: Int
        if self.mauSo == 0 || a.mauSo == 0 { return nil }
        if self.mauSo == a.mauSo {
            tuMoi = self.tuSo + a.tuSo
            mauMoi = self.mauSo
        } else {
            tuMoi = self.tuSo * a.mauSo + a.tuSo * self.mauSo
            mauMoi = self.mauSo * a.mauSo
        }
        return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
    }
    
    func tinhTru(a: PhanSo!) -> PhanSo? {
        let tuMoi: Int
        let mauMoi: Int
        
        if self.mauSo == 0 || a.mauSo == 0 { return nil }
        if self.mauSo == a.mauSo {
            tuMoi = self.tuSo - a.tuSo
            mauMoi = self.mauSo
        } else {
            tuMoi = self.tuSo * a.mauSo - a.tuSo * self.mauSo
            mauMoi = self.mauSo * a.mauSo
        }
        return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
    }
    
    func tinhNhan(a: PhanSo!) -> PhanSo? {
        if self.mauSo == 0 || a.mauSo == 0 { return nil }
        let tuMoi: Int = self.tuSo * a.tuSo
        let mauMoi: Int = self.mauSo * a.mauSo
        return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
    }
    
    func tinhChia(a: PhanSo!) -> PhanSo? {
        if self.mauSo == 0 || a.mauSo == 0 { return nil }
        let tuMoi: Int = self.tuSo * a.mauSo
        let mauMoi: Int = self.mauSo * a.tuSo
        return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
    }
}

let a: PhanSo = PhanSo(tuSo: 2, mauSo: 2)
let b: PhanSo! = a.tinhCong(a: PhanSo(tuSo: 1, mauSo: 2))
let c: PhanSo! = a.tinhTru(a: PhanSo(tuSo: 2, mauSo: 3))
let d: PhanSo! = a.tinhNhan(a: PhanSo(tuSo: 2, mauSo: 4))
let e: PhanSo! = a.tinhChia(a: PhanSo(tuSo: 6, mauSo: 5))
print(b.inManHinh())
print(c.inManHinh())
print(d.inManHinh())
print(e.inManHinh())
