import Foundation

class PhanSo {
    var tuSo: Int
    var mauSo: Int
    
    init?(tuSo: Int, mauSo: Int) {
        if mauSo == 0 {
            return nil
        } else {
            self.tuSo = tuSo
            self.mauSo = mauSo
        }
    }
    
    func tinhCong(a: PhanSo) -> PhanSo? {
        let tuMoi: Int
        let mauMoi: Int
        if self.mauSo == a.mauSo {
            tuMoi = self.tuSo + a.tuSo
            mauMoi = self.mauSo
        } else {
            tuMoi = self.tuSo * a.mauSo + a.tuSo * self.mauSo
            mauMoi = self.mauSo * a.mauSo
        }
        return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
    }
    
    func tinhTru(a: PhanSo) -> PhanSo? {
        let tuMoi: Int
        let mauMoi: Int
        
        if self.mauSo == a.mauSo {
            tuMoi = self.tuSo - a.tuSo
            mauMoi = self.mauSo
        } else {
            tuMoi = self.tuSo * a.mauSo - a.tuSo * self.mauSo
            mauMoi = self.mauSo * a.mauSo
        }
        return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
    }
    
    func tinhNhan(a: PhanSo) -> PhanSo? {
        let tuMoi: Int = self.tuSo * a.tuSo
        let mauMoi: Int = self.mauSo * a.mauSo
        return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
    }
    
    func tinhChia(a: PhanSo) -> PhanSo? {
        let tuMoi: Int = self.tuSo * a.mauSo
        let mauMoi: Int = self.mauSo * a.tuSo
        return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
    }
}

if let phanso1 = PhanSo(tuSo: 1, mauSo: 2), let phanso2 = PhanSo(tuSo: 1, mauSo: 4), let tong = phanso1.tinhCong(a: phanso2), let hieu = phanso1.tinhTru(a: phanso2), let tich = phanso1.tinhNhan(a: phanso2), let thuong = phanso1.tinhChia(a: phanso2) {
    print("Tong: \(tong.tuSo) / \(tong.mauSo)")
    print("Hieu: \(hieu.tuSo) / \(hieu.mauSo)")
    print("Tich: \(tich.tuSo) / \(tich.mauSo)")
    print("Thuong: \(thuong.tuSo) / \(thuong.mauSo)")
} else {
    print("mau so = 0")
}
