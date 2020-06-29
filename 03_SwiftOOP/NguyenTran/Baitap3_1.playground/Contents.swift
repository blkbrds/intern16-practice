import UIKit
import Foundation

//Làm sao để chặn không có mẫu số bằng 0???
class PhanSo {
    var TuSo: Int
    var MauSo: Int

    init(TuSo: Int, MauSo: Int) {
           self.TuSo = TuSo
           self.MauSo = MauSo
    }
    
    func cong (ps2: PhanSo) -> PhanSo {
        let pTuSo = self.TuSo * ps2.MauSo + ps2.TuSo * self.MauSo
        let pMauSo = self.MauSo * ps2.MauSo
        return PhanSo(TuSo: pTuSo, MauSo: pMauSo)
    }

    func tru (ps2: PhanSo) -> PhanSo {
        let pTuSo = TuSo * ps2.MauSo - ps2.TuSo * MauSo
        let pMauSo = MauSo * ps2.MauSo
        return PhanSo(TuSo: pTuSo, MauSo: pMauSo)
    }

    func nhan (ps2: PhanSo) -> PhanSo {
        let pTuSo = TuSo * ps2.TuSo
        let pMauSo = MauSo * ps2.MauSo
        return PhanSo(TuSo: pTuSo, MauSo: pMauSo)
    }

    func chia (ps2: PhanSo) -> PhanSo {
        let pTuSo = TuSo * ps2.MauSo
        let pMauSo = MauSo * ps2.TuSo
        return PhanSo(TuSo: pTuSo, MauSo: pMauSo)
    }
    
    func rutgon() -> PhanSo {
        func UCLN (a:Int, b:Int) -> Int {
            var x = abs(a)
            var y = abs(b)
            if x == 0 || y == 0 {
                return x + y
            }
            while x != y {
                if x>y {
                    x = x - y
                } else {
                    y = y - x
                }
            }
            return x
        }

        if self.TuSo == 0 {
            return PhanSo(TuSo: 0, MauSo: 1)
        }
        if self.MauSo < 0 {
            self.TuSo = -self.TuSo
            self.MauSo = -self.MauSo
        }
        let i = UCLN(a:self.TuSo, b:self.MauSo)
        return PhanSo(TuSo: self.TuSo/i, MauSo: self.MauSo/i)
        }
    
    func xuat() -> String {
        let ps_rutgon = self.rutgon()
        if ps_rutgon.MauSo == 1 {
            return "\(ps_rutgon.TuSo)"
        }
        else {
            return "\(ps_rutgon.TuSo)/\(ps_rutgon.MauSo)"
        }
    }
    
    func check() -> Bool {
        if self.MauSo == 0 {
            return false
        } else {
            return true
        }
    }
}

var ps1 = PhanSo(TuSo: 4, MauSo: 0)
var ps2 = PhanSo(TuSo: 3, MauSo: 5)

//Cong phan so
if ps1.check() == false || ps2.check() == false {
    print("Error: Không thể thực hiện phép cộng với phân số có mẫu bằng 0.")
} else {
    let resultCong = ps1.cong(ps2: ps2).xuat()
    print("\(ps1.xuat()) + \(ps2.xuat()) = \(resultCong)")
}

//Tru phan so
if ps1.check() == false || ps2.check() == false {
    print("Error: Không thể thực hiện phép trừ với phân số có mẫu bằng 0.")
} else {
    let resultTru = ps1.tru(ps2: ps2).xuat()
    print("\(ps1.xuat()) - \(ps2.xuat()) = \(resultTru)")
}

//Nhan phan so
if ps1.check() == false || ps2.check() == false {
    print("Error: Không thể thực hiện phép nhân với phân số có mẫu bằng 0.")
} else {
    let resultNhan = ps1.nhan(ps2: ps2).xuat()
    print("\(ps1.xuat()) x \(ps2.xuat()) = \(resultNhan)")
}

//Chia phan so
if ps1.check() == false || ps2.check() == false {
    print("Error: Không thể thực hiện phép chia với phân số có mẫu bằng 0.")
} else {
    let resultChia = ps1.chia(ps2: ps2).xuat()
    print("\(ps1.xuat()) / \(ps2.xuat()) = \(resultChia)")
}


