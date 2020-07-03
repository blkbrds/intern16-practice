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
    func congPhanSo(phanSo2: PhanSo) -> PhanSo {
        let tuMoi = tu * phanSo2.mau + mau * phanSo2.tu
        let mauMoi = mau * phanSo2.mau
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }

    // Tru phan so
    func truPhanSo(phanSo2: PhanSo) -> PhanSo {
        let tuMoi = tu * phanSo2.mau - mau * phanSo2.tu
        let mauMoi = mau * phanSo2.mau
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }

    // Nhan phan so
    func nhanPhanSo(phanSo2: PhanSo) -> PhanSo {
        let tuMoi = tu * phanSo2.tu
        let mauMoi = mau * phanSo2.mau
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }

    // Chia phan so
    func chiaPhanSo(phanSo2: PhanSo) -> PhanSo {
        let tuMoi = tu * phanSo2.mau
        let mauMoi = mau * phanSo2.tu
        return PhanSo(tu: tuMoi, mau: mauMoi)
    }
}

// Khoi tao
let phanSo1 = PhanSo(tu: 1, mau: 2)
let phanSo2 = PhanSo(tu: 2, mau: 3)
print("Phan so 1 la: \(phanSo1.inPhanSo())")
print("Phan so 2 la: \(phanSo2.inPhanSo())")
// Thuc hien phep tinh
let tongPhanSo = phanSo1.congPhanSo(phanSo2: phanSo2)
let hieuPhanSo = phanSo1.truPhanSo(phanSo2: phanSo2)
let tichPhanSo = phanSo1.nhanPhanSo(phanSo2: phanSo2)
let thuongPhanSo = phanSo1.chiaPhanSo(phanSo2: phanSo2)
// In ra
print("Tong 2 phan so la: \(tongPhanSo.inPhanSo())")
print("Hieu 2 phan so la: \(hieuPhanSo.inPhanSo())")
print("Tich 2 phan so la: \(tichPhanSo.inPhanSo())")
print("Thuong 2 phan so la: \(thuongPhanSo.inPhanSo())")
