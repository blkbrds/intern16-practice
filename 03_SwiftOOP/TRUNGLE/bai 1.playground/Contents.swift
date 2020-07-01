import Foundation
class PhanSo {
     var tuSo: Double
     var mauSo: Double
    
    init?(tuSo: Double, mauSo: Double) {
        self.tuSo = tuSo
        if mauSo == 0 {
            return nil
        }
        self.mauSo = mauSo
    }
    
    
    func UCLN( num1: Double,  num2: Double) -> Double {
        var a = abs(num1)
        var b = abs(num2)
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
    
    func cong( b: PhanSo?) -> PhanSo? {
        guard let b = b else { return nil }
        return PhanSo(tuSo: tuSo * b.mauSo + b.tuSo * mauSo, mauSo: mauSo * b.mauSo)
    }
    
    func tru( b: PhanSo?) -> PhanSo? {
        guard let b = b else { return nil }
        return PhanSo(tuSo: tuSo * b.mauSo - b.tuSo * mauSo, mauSo: mauSo * b.mauSo)
    }
    
    func nhan( b: PhanSo?) -> PhanSo? {
        guard let b = b else { return nil }
        return PhanSo(tuSo: tuSo * b.tuSo, mauSo: mauSo * b.mauSo)
    }
    
    func chia(b: PhanSo?) -> PhanSo? {
        guard let b = b else { return nil }
        return PhanSo(tuSo: tuSo * b.mauSo, mauSo: mauSo * b.tuSo)
    }
    
    func InPhanSo() -> String {
        return "Phan so: \(tuSo / UCLN(num1: tuSo, num2: mauSo)) / \(mauSo / UCLN(num1: tuSo, num2: mauSo))"
    }
}

var a = PhanSo(tuSo: 1, mauSo: 2)
var b = PhanSo(tuSo: 3, mauSo: 0)

print("Cong phan so ")
if let ps1 = a, let ps2 = b {
    if let cong = ps1.cong(b: ps2) {
        print(cong.InPhanSo())
    }
}

print("Tru phan so ")
if let ps1 = a, let ps2 = b {
    if let tru = ps1.tru(b: ps2) {
        print(tru.InPhanSo())
    }
}

print("Nhan phan so")
if let ps1 = a, let ps2 = b {
    if let nhan = ps1.nhan(b: ps2) {
        print(nhan.InPhanSo())
    }
}

print("Chia phan so")
if let ps1 = a, let ps2 = b {
    if let chia = ps1.chia(b: ps2) {
        print(chia.InPhanSo())
    }
}

