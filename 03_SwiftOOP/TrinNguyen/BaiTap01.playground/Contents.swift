import UIKit

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
        //cong phan so
        func congPS(ps2: PhanSo) -> (PhanSo) {
            let tuMoi = tu * ps2.mau + mau * ps2.tu
            let mauMoi = mau * ps2.mau
            return PhanSo(tu: tuMoi, mau: mauMoi)
        }
        //tru phan so
        func truPS(ps2: PhanSo) -> (PhanSo) {
            let tuMoi = tu * ps2.mau - mau * ps2.tu
            let mauMoi = mau * ps2.mau
            return PhanSo(tu: tuMoi, mau: mauMoi)
        }
        //nhan phan so
        func nhanPS(ps2: PhanSo) -> (PhanSo) {
            let tuMoi = tu * ps2.tu
            let mauMoi = mau * ps2.mau
            return PhanSo(tu: tuMoi, mau: mauMoi)
        }
        //chia phan so
        func chiaPS(ps2: PhanSo) -> (PhanSo) {
            let tuMoi = tu * ps2.mau
            let mauMoi = mau * ps2.tu
            return PhanSo(tu: tuMoi, mau: mauMoi)
        }
    }
    //khoi tao
    let ps1 = PhanSo(tu: 1, mau: 2)
    let ps2 = PhanSo(tu: 2, mau: 3)
    print("Phan so 1 la: \(ps1.inPhanSo())")
    print("Phan so 2 la: \(ps2.inPhanSo())")
    //thuc hien phep tinh
    let tongPS = ps1.congPS(ps2: ps2)
    let hieuPS = ps1.truPS(ps2: ps2)
    let tichPS = ps1.nhanPS(ps2: ps2)
    let thuongPS = ps1.chiaPS(ps2: ps2)
    //in ra
    print("Tong 2 phan so la: \(tongPS.inPhanSo())")
    print("Hieu 2 phan so la: \(hieuPS.inPhanSo())")
    print("Tich 2 phan so la: \(tichPS.inPhanSo())")
    print("Thuong 2 phan so la: \(thuongPS.inPhanSo())")


