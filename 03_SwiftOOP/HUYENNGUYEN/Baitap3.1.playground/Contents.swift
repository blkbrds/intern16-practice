import UIKit

class PhanSo {
    let tuSo: Int, mauSo: Int
    
    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    
    func pritnScreen() -> String {
            return "\(self.tuSo)/\(self.mauSo)"
        }

        func celPlus(voi a: PhanSo) -> PhanSo {
            let tuMoi: Int
            let mauMoi: Int

            if self.mauSo == a.mauSo {
                tuMoi = self.tuSo + a.tuSo
                mauMoi = self.mauSo
            } else {
                tuMoi = self.tuSo * a.mauSo + a.tuSo * self.mauSo
                mauMoi = self.mauSo * a.mauSo
            }
            return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
        }

        func calSub(voi a: PhanSo) -> PhanSo {
            let tuMoi: Int
            let mauMoi: Int

            if self.mauSo == a.mauSo {
                tuMoi = self.tuSo - a.tuSo
                mauMoi = self.mauSo
            } else {
                tuMoi = self.tuSo * a.mauSo - a.tuSo * self.mauSo
                mauMoi = self.mauSo * a.mauSo
            }
            return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
        }

        func calMulti(voi a: PhanSo) -> PhanSo {
            let tuMoi: Int = self.tuSo * a.tuSo
            let mauMoi: Int = self.mauSo * a.mauSo
            return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
        }

        func calDiv(voi a: PhanSo) -> PhanSo {
            let tuMoi: Int = self.tuSo * a.mauSo
            let mauMoi: Int = self.mauSo * a.tuSo
            return PhanSo(tuSo: tuMoi, mauSo: mauMoi)
        }
    }

    let a: PhanSo = PhanSo(tuSo: 2, mauSo: 3)
    let b: PhanSo = a.celPlus(voi: PhanSo(tuSo: 1, mauSo: 2))
    let c: PhanSo = a.calSub(voi: PhanSo(tuSo: 2, mauSo: 3))
    let d: PhanSo = a.calMulti(voi: PhanSo(tuSo: 2, mauSo: 4))
    let e: PhanSo = a.calDiv(voi: PhanSo(tuSo: 6, mauSo: 5))
    print(b.pritnScreen())
    print(c.pritnScreen())
    print(d.pritnScreen())
    print(e.pritnScreen())
