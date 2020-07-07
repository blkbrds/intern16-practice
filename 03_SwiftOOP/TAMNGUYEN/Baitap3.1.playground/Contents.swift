import UIKit

class PhanSo {
    
    var tu: Int
    var mau: Int
    
    init(tu: Int, mau: Int) {
        self.tu = tu
        self.mau = mau
    }
    
    func kiemTraPhanSo(phanso2: PhanSo) -> Bool {
        if mau == 0 {
            return false
        }
        return true
    }
    
    func cong(phanso2: PhanSo) -> PhanSo {
        let tux: Int = tu * phanso2.mau + phanso2.tu * mau
        let maux: Int = mau * phanso2.mau
        return PhanSo(tu: tux, mau: maux)
    }
    
    func tru(phanso2: PhanSo) -> PhanSo {
        let tux: Int = tu * phanso2.mau - phanso2.tu * mau
        let maux: Int = mau * phanso2.mau
        return PhanSo(tu: tux, mau: maux)
    }
    
    func nhan(phanso2: PhanSo) -> PhanSo {
        let tux: Int = tu * phanso2.tu
        let maux: Int = mau * phanso2.mau
        return PhanSo(tu: tux, mau: maux)
    }
    
    func chia(ps2: PhanSo) -> PhanSo {
        let tux: Int = tu * ps2.mau
        let maux: Int = mau * ps2.tu
        return PhanSo(tu: tux, mau: maux)
    }
}

let phanso1 = PhanSo(tu: 1, mau: 2)
let phanso2 = PhanSo(tu: 2, mau: 3)

phanso1.cong(phanso2: phanso2)
