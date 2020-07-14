import UIKit
 // Bai 2 : DA GIAC
class DaGiac {
    var soCanh : Int = 0
    var kichthuoc : [Double] = []
        
  init(soCanh: Int, kichthuoc: [Double] = []) {
           self.soCanh = soCanh
           guard soCanh <= 2 else {
               self.kichthuoc = kichthuoc
               return
           }
       }
    func tinhtoan () -> Double {
        var chuVi : Double = 0.0
        guard soCanh <= 2 || kichthuoc.contains(0) || soCanh == kichthuoc.count  else {
            return 0
        }
            for i in kichthuoc {
                if i == 0
                {
                    chuVi = 0.0
                    break
                }
                else {
                    chuVi += i
                }
            }
        
        return chuVi
    }
    func inCanhDaGiac () {
        for i in kichthuoc {
            print("Canh cua da giac: \(i)")
        }
    }
}

var tamgiac = DaGiac(soCanh: 3, kichthuoc: [1,2,3])
print("CHUVI: \(tamgiac.tinhtoan())")

 // BAI 3 : THUA KE DA GIAC

class TamGiac : DaGiac {
    var chuVi = 0.0
    
    override func tinhtoan() -> Double {
        if soCanh != kichthuoc.count {
            return chuVi
        } else  if  soCanh != 3  {
           return 0
        } else {
            for i in kichthuoc {
                chuVi += i
            }
        }
        return chuVi
    }
    
    
    func tinhDienTich() -> Double {
        var dtTamGiac: Double = 0.0
     let p: Double = Double((kichthuoc[0] + kichthuoc[1] + kichthuoc[2]) / 2)
        if soCanh != kichthuoc.count  || soCanh != 3  || kichthuoc[0]  + kichthuoc[1] < kichthuoc[2]  || kichthuoc[0] + kichthuoc[2] < kichthuoc[1] || kichthuoc[1] + kichthuoc[2] < kichthuoc[0] {
           return 0
        }
        else {
          dtTamGiac = sqrt(p * (p - kichthuoc[0]) * (p - kichthuoc[1]) * (p - kichthuoc[2]))
        }
        return dtTamGiac
    }
}

var tamgiac1 = TamGiac(soCanh: 3, kichthuoc: [3,4,5])
print(tamgiac1.tinhtoan())
print(tamgiac1.tinhDienTich())

