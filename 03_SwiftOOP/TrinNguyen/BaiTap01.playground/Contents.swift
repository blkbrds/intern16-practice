import Foundation

class PhanSo {
    var tu: Int
    var mau: Int

    init?(tu: Int, mau: Int) {
        if mau != 0 {
            self.tu = tu
            self.mau = mau
        } else {
            return nil
        }
    }

    func inPhanSo() {
        if mau != 0 {
            print("\(tu)/\(mau)")
        } else {
            print("Mau so phai khac 0")
        }
    }

    // Cong phan so
    func congPhanSo(phanSo2: PhanSo) -> PhanSo? {
        let tuMoi = tu * phanSo2.mau + mau * phanSo2.tu
        let mauMoi = mau * phanSo2.mau
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }

    // Tru phan so
    func truPhanSo(phanSo2: PhanSo) -> PhanSo? {
        let tuMoi = tu * phanSo2.mau - mau * phanSo2.tu
        let mauMoi = mau * phanSo2.mau
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }

    // Nhan phan so
    func nhanPhanSo(phanSo2: PhanSo) -> PhanSo? {
        let tuMoi = tu * phanSo2.tu
        let mauMoi = mau * phanSo2.mau
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }

    // Chia phan so
    func chiaPhanSo(phanSo2: PhanSo) -> PhanSo? {
        let tuMoi = tu * phanSo2.mau
        let mauMoi = mau * phanSo2.tu
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }
}

// Thuc hien phep tinh
if let phanSo1 = PhanSo(tu: 1, mau: 2), let phanSo2 = PhanSo(tu: 2, mau: 7) {
    if let ketQuaCong = phanSo1.congPhanSo(phanSo2: phanSo2) {
        ketQuaCong.inPhanSo()
    }
    if let ketQuaTru = phanSo1.truPhanSo(phanSo2: phanSo2) {
        ketQuaTru.inPhanSo()
    }
    if let ketQuaNhan = phanSo1.nhanPhanSo(phanSo2: phanSo2) {
        ketQuaNhan.inPhanSo()
    }
    if let ketQuaChia = phanSo1.chiaPhanSo(phanSo2: phanSo2) {
        ketQuaChia.inPhanSo()
    }
} else {
    print("Mau so phai khac khong")
}

