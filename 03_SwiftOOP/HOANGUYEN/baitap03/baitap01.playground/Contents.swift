import UIKit
import Foundation

//MARK: class phân số
class PhanSo {
  var tuSo: Int = 0
  var mauSo: Int = 0
    
   enum enumCheckPS {
        case hople(Int, Int)
        case khonghople
    }
    func checkPS(tu: Int, mau: Int) -> enumCheckPS {
        if mau == 0 {
            return .khonghople
        }
        else {
            return .hople(tu, mau)
        }
    }
    
  init?(tu: Int, mau: Int) {
    let ps = self.checkPS(tu: tu, mau: mau)
    switch ps {
    case .hople(let a, let b):
        self.mauSo = b
        self.tuSo = a
    case .khonghople:
        print("Bạn nhập mẫu số = 0")
        return nil
    }
  }

  func congHaiPhanSo(ps2: PhanSo?) -> PhanSo? {
    guard let ps2 = ps2 else { return nil }
    let tuSoMoi = self.tuSo * ps2.mauSo + ps2.tuSo * self.mauSo
    let mauSoMoi = self.mauSo * ps2.mauSo
    let ps = PhanSo(tu: tuSoMoi, mau: mauSoMoi)
    return ps
  }
  func truHaiPhanSo(ps2: PhanSo?) -> PhanSo? {
    guard let ps2 = ps2 else { return nil }
    let tuSoMoi = self.tuSo * ps2.mauSo - ps2.tuSo * self.mauSo
    let mauSoMoi = self.mauSo * ps2.mauSo
    let ps = PhanSo(tu: tuSoMoi, mau: mauSoMoi)
    return ps
  }
  func nhanHaiPhanSo(ps2: PhanSo?) -> PhanSo? {
    guard let ps2 = ps2 else { return nil }
    let tuSo = self.tuSo * ps2.tuSo
    let mauSo = self.mauSo * ps2.mauSo
    return PhanSo(tu: tuSo, mau: mauSo)
  }
  func chiaHaiPhanSo(ps2: PhanSo?) -> PhanSo? {
    guard let ps2 = ps2 else { return nil }
    let daoPs2 = PhanSo(tu: ps2.mauSo, mau: ps2.tuSo)
    let ps = nhanHaiPhanSo(ps2: daoPs2)
    return ps
  }
}
//MARK: kiểm tra kết quả
// tạo 2 phân số
let phanSo1 = PhanSo(tu: 1, mau: 2)
let phanSo2 = PhanSo(tu: 4, mau: 0)
print("phân số 1 là : \(phanSo1!.tuSo) / \(phanSo1!.mauSo)")
print("phân số 2 là : \(phanSo2!.tuSo) / \(phanSo2!.mauSo)")
phanSo1!.congHaiPhanSo(ps2: phanSo2)

