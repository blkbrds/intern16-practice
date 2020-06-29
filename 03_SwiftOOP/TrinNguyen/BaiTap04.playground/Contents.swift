import Foundation

class DaGiac {
  var canh: Int
  var arrayCanh = [Int]()
  init(canh: Int, arrayCanh: [Int]) {
    self.canh = canh
    self.arrayCanh = arrayCanh
  }
  func checkTamGiacVuong() -> Int {
    var kq: Int = 0
     if (arrayCanh[0] * arrayCanh[0]) + (arrayCanh[1] * arrayCanh[1]) == (arrayCanh[2] * arrayCanh[2]) {
         kq = 1
     }
     else{
         kq = 0
         }
    return kq
    }
  func inCanh() -> Int {
    for canh in 0..<arrayCanh.count {
      print("Cac canh cua da giac la: \(arrayCanh[canh])")
    }
    return canh
  }
 }
let daGiac = DaGiac(canh: 3, arrayCanh: [3, 4, 5])
    if daGiac.checkTamGiacVuong() == 1{
        daGiac.inCanh()
    }
    else{
        print("Tam giac ban vua nhap khong phai tam giac vuong")
    }
