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

    func cong (ps2: PhanSo) -> PhanSo? {
        let pTuSo = self.tuSo * ps2.mauSo + ps2.tuSo * self.mauSo
        let pMauSo = self.mauSo * ps2.mauSo
        return PhanSo(tuSo: pTuSo, mauSo: pMauSo) ?? nil
    }

    func tru (ps2: PhanSo) -> PhanSo? {
        let pTuSo = tuSo * ps2.mauSo - ps2.tuSo * mauSo
        let pMauSo = mauSo * ps2.mauSo
        return PhanSo(tuSo: pTuSo, mauSo: pMauSo) ?? nil
    }

    func nhan (ps2: PhanSo) -> PhanSo? {
        let pTuSo = tuSo * ps2.tuSo
        let pMauSo = mauSo * ps2.mauSo
        return PhanSo(tuSo: pTuSo, mauSo: pMauSo) ?? nil
    }

    func chia (ps2: PhanSo) -> PhanSo? {
        let pTuSo = tuSo * ps2.mauSo
        let pMauSo = mauSo * ps2.tuSo
        return PhanSo(tuSo: pTuSo, mauSo: pMauSo) ?? nil
    }

    func rutgon() -> PhanSo? {
        func UCLN (a: Int, b: Int) -> Int {
            var x = abs(a)
            var y = abs(b)
            if x == 0 || y == 0 {
                return x + y
            }
            while x != y {
                if x > y {
                    x = x - y
                } else {
                    y = y - x
                }
            }
            return x
        }

        if self.tuSo == 0 {
            return PhanSo(tuSo: 0, mauSo: 1) ?? nil
        }
        if self.mauSo < 0 {
            self.tuSo = -self.tuSo
            self.mauSo = -self.mauSo
        }
        let i = UCLN(a: self.tuSo, b: self.mauSo)
        return PhanSo(tuSo: self.tuSo / i, mauSo: self.mauSo / i)
    }

    func xuat() -> String {
        if let ps_rutgon = self.rutgon() {
            if ps_rutgon.mauSo == 1 {
                return "\(ps_rutgon.tuSo)"
            } else {
                return "\(String(describing: ps_rutgon.tuSo))/\(String(describing: ps_rutgon.mauSo))"
            }
        } else {
            return ""
        }
    }
}

if let ps1 = PhanSo(tuSo: 2, mauSo: 8), let ps2 = PhanSo(tuSo: 1, mauSo: 4), let resultCong = ps1.cong(ps2: ps2), let resultTru = ps1.tru(ps2: ps2), let resultNhan = ps1.nhan(ps2: ps2), let resultChia = ps1.chia(ps2: ps2) {
    print("Tổng hai phân số là = \(resultCong.xuat())")
    print("Hiệu hai phân số là = \(resultTru.xuat())")
    print("Tích hai phân số là = \(resultNhan.xuat())")
    print("Thương hai phân số là = \(resultChia.xuat())")
} else {
    print("Error: Không thể thực hiện chương trình vì phân số có mẫu bằng 0.")
}
