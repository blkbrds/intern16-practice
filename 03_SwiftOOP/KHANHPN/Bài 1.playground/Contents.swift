import UIKit

class PhanSo {
    var tu: Int
    var mau: Int

    init(tu: Int, mau: Int) {
        self.tu = tu
        self.mau = mau
    }

    func xuat() -> String {
        return "\(tu)/\(mau)"
    }

    func cong(ps2: PhanSo) -> PhanSo {
        let tu1 = tu * ps2.mau + ps2.tu * mau
        let mau1 = mau * ps2.mau
        return PhanSo(tu: tu1, mau: mau1)
    }

    func tru(ps2: PhanSo) -> PhanSo {
        let tu1 = tu * ps2.mau - ps2.tu * mau
        let mau1 = mau * ps2.mau
        return PhanSo(tu: tu1, mau: mau1)
    }

    func nhan(ps2: PhanSo) -> PhanSo {
        let tu1 = tu * ps2.tu
        let mau1 = mau * ps2.mau
        return PhanSo(tu: tu1, mau: mau1)
    }
    
    func chia(ps2: PhanSo) -> PhanSo {
        let tu1 = tu * ps2.mau
        let mau1 = mau * ps2.tu
        return PhanSo(tu: tu1, mau: mau1)
    }
}

let a = PhanSo(tu: 1, mau: 2)
let b = PhanSo(tu: 3, mau: 4)
let b1 = a.cong(ps2: b)
let b2 = a.tru(ps2: b)
let b3 = a.nhan(ps2: b)
let b4 = a.chia(ps2: b)

print("cong = \(b1.xuat())")
print("tru = \(b2.xuat())")
print("nhan = \(b3.xuat())")
print("chia = \(b4.xuat())")

// print("Ket qua \(a.xuat()) + \(c.xuat()) = \(b.xuat())")
