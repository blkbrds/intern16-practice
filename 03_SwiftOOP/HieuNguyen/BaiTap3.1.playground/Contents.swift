import Foundation

class PhanSo {
    var tuSo: Int
    var mauSo: Int

    init?(tuSo: Int, mauSo: Int) {
        if mauSo != 0 {
            self.tuSo = tuSo
            self.mauSo = mauSo
        } else {
            return nil
        }
    }
    
    func xuat() {
        if mauSo != 0 {
            print("KQ: \(tuSo) / \(mauSo)")
        } else {
            print("Mau so phai khac 0")
        }
    }
    
    func cong(ps: PhanSo) -> PhanSo? {
        let tuSoKq = tuSo * ps.mauSo + mauSo * ps.tuSo
        let mauSoKq = mauSo * ps.mauSo
        return PhanSo(tuSo: tuSoKq, mauSo: mauSoKq)
    }

    func tru(ps: PhanSo) -> PhanSo? {
        let tuSoKq = tuSo * ps.mauSo - mauSo * ps.tuSo
        let mauSoKq = mauSo * ps.mauSo
        return PhanSo(tuSo: tuSoKq, mauSo: mauSoKq)
    }

    func nhan(ps: PhanSo) -> PhanSo? {
        let tuSoKq = tuSo * ps.tuSo
        let mauSoKq = mauSo * ps.mauSo
        return PhanSo(tuSo: tuSoKq, mauSo: mauSoKq)
    }

    func chia(ps: PhanSo) -> PhanSo? {
        let tuSoKq = tuSo * ps.mauSo
        let mauSoKq = mauSo * ps.tuSo
        return PhanSo(tuSo: tuSoKq, mauSo: mauSoKq)
    }
}

if let phanSo1 = PhanSo(tuSo: 3, mauSo: 8), let phanSo2 = PhanSo(tuSo: 3, mauSo: 8) {
    if let kqCong = phanSo1.cong(ps: phanSo2) {
        kqCong.xuat()
    }
    if let kqTru = phanSo1.tru(ps: phanSo2) {
        kqTru.xuat()
    }
    if let kqNhan = phanSo1.nhan(ps: phanSo2) {
        kqNhan.xuat()
    }
    if let kqChia = phanSo1.chia(ps: phanSo2) {
        kqChia.xuat()
    }
} else {
    print("Mau so phai khac 0")
}
