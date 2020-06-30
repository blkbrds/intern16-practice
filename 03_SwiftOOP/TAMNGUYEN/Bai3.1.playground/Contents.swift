
class PhanSo {
    
    var tu: Int = 0
    var mau: Int = 0
    
    init(tu: Int, mau: Int) {
        self.tu = tu
        self.mau = mau
    }
    
    func cong(ps2: PhanSo) -> PhanSo {
        let tux: Int = tu * ps2.mau + ps2.tu * mau
        let maux: Int = mau * ps2.mau
        return PhanSo(tu: tux, mau: maux)
    }
    
    func tru(ps2: PhanSo) -> PhanSo {
        let tux: Int = tu * ps2.mau - ps2.tu * mau
        let maux: Int = mau * ps2.mau
        return PhanSo(tu: tux, mau: maux)
    }
    
    func nhan(ps2: PhanSo) -> PhanSo {
        let tux: Int = tu * ps2.tu
        let maux: Int = mau * ps2.mau
        return PhanSo(tu: tux, mau: maux)
    }
    
    func chia(ps2: PhanSo) -> PhanSo {
        let tux: Int = tu * ps2.mau
        let maux: Int = mau * ps2.tu
        return PhanSo(tu: tux, mau: maux)
    }
}

let ps1 = PhanSo(tu: 1, mau: 2)
let ps2 = PhanSo(tu: 2, mau: 3)
ps1.cong(ps2: ps2)
ps1.tru(ps2: ps2)
ps1.nhan(ps2: ps2)
ps1.chia(ps2: ps2)
