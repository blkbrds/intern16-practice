import UIKit

class DaGiac {
    var canh: Int
    var arrayCanh = [Int]()

    init(canh: Int, arrayCanh: [Int]) {
        self.canh = canh
        self.arrayCanh = arrayCanh
    }

    func tinhChuVi() -> Int {
        var chuvi = 0
        for canh in 0..<arrayCanh.count {
            chuvi += arrayCanh[canh]
        }
        return chuvi

    }
    func inCanh() -> Int {
        for canh in 0..<arrayCanh.count {
            print("Cac canh cua da giac la: \(arrayCanh[canh])")
        }
        return canh
    }


}
let daGiac = DaGiac(canh: 3, arrayCanh: [1, 2, 3])
print("Chu vi cua da giac la: \(daGiac.tinhChuVi())")
daGiac.inCanh()


//bai3
class TamGiac : DaGiac {
  override func tinhChuVi() -> Int {
    //super.tinhChuVi()
    var dientich = 0
    //for canh in 0..<arrayCanh.count {
    //  dientich += arrayCanh[canh]
    //}
    dientich = (arrayCanh[0]+arrayCanh[1])/2
    return dientich
  }
}
let tamGiac = TamGiac(canh: 2, arrayCanh: [2,2])
print("Dien tich cua tam giac la: \(tamGiac.tinhChuVi())")

