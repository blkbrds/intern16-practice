import Foundation

//phanso
class PhanSo {
    var tu: Int
    var mau: Int

    init(tu: Int, mau: Int) {
        self.tu = tu
        self.mau = mau
    }

    func inPhanSo() -> String {
        return "\(tu)/\(mau)"
    }

    // Cong phan so
    func congPhanSo(ps2: PhanSo) -> PhanSo {
        let tuMoi = tu * ps2.mau + mau * ps2.tu
        let mauMoi = mau * ps2.mau
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }

    // Tru phan so
    func truPhanSo(ps2: PhanSo) -> PhanSo {
        let tuMoi = tu * ps2.mau - mau * ps2.tu
        let mauMoi = mau * ps2.mau
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }

    // Nhan phan so
    func nhanPhanSo(ps2: PhanSo) -> PhanSo {
        let tuMoi = tu * ps2.tu
        let mauMoi = mau * ps2.mau
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }

    // Chia phan so
    func chiaPhanSo(ps2: PhanSo) -> PhanSo {
        let tuMoi = tu * ps2.mau
        let mauMoi = mau * ps2.tu
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }
}

// Khoi tao
let ps1 = PhanSo(tu: 1, mau: 2)
let ps2 = PhanSo(tu: 2, mau: 3)
print("Phan so 1 la: \(ps1.inPhanSo())")
print("Phan so 2 la: \(ps2.inPhanSo())")
// Thuc hien phep tinh
let tongPS = ps1.congPhanSo(ps2: ps2)
let hieuPS = ps1.truPhanSo(ps2: ps2)
let tichPS = ps1.nhanPhanSo(ps2: ps2)
let thuongPS = ps1.chiaPhanSo(ps2: ps2)
// In ra
print("Tong 2 phan so la: \(tongPS.inPhanSo())")
print("Hieu 2 phan so la: \(hieuPS.inPhanSo())")
print("Tich 2 phan so la: \(tichPS.inPhanSo())")
print("Thuong 2 phan so la: \(thuongPS.inPhanSo())")
