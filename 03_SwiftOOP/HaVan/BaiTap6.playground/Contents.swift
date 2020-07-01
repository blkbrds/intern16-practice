import Foundation

enum TinhToan {
    case khongPhaiHinh
    case laHinh(Double)
}

class HinhVe {
    var tenHinh:String
    var soCanh: Int
    var thongTinCacCanh: [Int]
    init(ten : String, soCanh: Int, thongTin : [Int]) {
        self.tenHinh = ten
        self.soCanh = soCanh
        self.thongTinCacCanh = thongTin
    }
    func isHinh() -> Bool {
        if soCanh == thongTinCacCanh.count {
            return true
        } else {
            return false
        }
    }
    
    func tinhDienTich() -> TinhToan {
        if isHinh() {
            var ketQua = 1.0
            for canh in thongTinCacCanh {
                ketQua *= Double(canh)
            }
            return .laHinh(ketQua)
        } else {
            return .khongPhaiHinh
        }
    }
  
}

// Hình học 2 chiều
class HaiChieu : HinhVe {
    
    func tinhChuVi() -> TinhToan {
          if isHinh(){
              var ketQua = 0
            for canh in super.thongTinCacCanh {
                  ketQua += canh
              }
              return .laHinh(Double(ketQua))
          } else {
              return .khongPhaiHinh
          }
      }
    
}

class Tron : HaiChieu {
    override init(ten: String, soCanh: Int, thongTin: [Int]) {
        super.init(ten: "tròn", soCanh: 1, thongTin: thongTin)
    }

    override func tinhDienTich() -> TinhToan {
        if isHinh() {
            return .laHinh(3.14 * pow(Double(self.thongTinCacCanh[0]), 2.0))
         } else {
            return .khongPhaiHinh
        }
    }

    override func tinhChuVi() -> TinhToan {
        if isHinh() {
            return .laHinh(2 * 3.14 * pow(Double(self.thongTinCacCanh[0]), 2.0))
        } else {
            return .khongPhaiHinh
        }
    }
}

class TamGiac: HaiChieu {
    override init(ten: String, soCanh: Int, thongTin: [Int]) {
        super.init(ten: "tam giác", soCanh: 3, thongTin: thongTin)
    }
    
    override func isHinh() -> Bool {
        super.isHinh()
        if self.thongTinCacCanh[0] + self.thongTinCacCanh[1] > self.thongTinCacCanh[2] && self.thongTinCacCanh[1] + self.thongTinCacCanh[2] > 0 && self.thongTinCacCanh[2] + self.thongTinCacCanh[0] > self.thongTinCacCanh[1] {
            return true
        } else {
            return false
        }
    }
    
    override func tinhDienTich() -> TinhToan {
        let chuVi = super.tinhChuVi()
        switch chuVi {
        case .laHinh(let cv):
            let nuaCV: Double = cv / 2
            return .laHinh(sqrt(nuaCV * (nuaCV - Double(self.thongTinCacCanh[0])) * (nuaCV - Double(self.thongTinCacCanh[1])) * (nuaCV * Double(self.thongTinCacCanh[2]))))
        default:
            return .khongPhaiHinh
        }
    }
}

class Vuong: HaiChieu {
    override init(ten: String, soCanh: Int, thongTin: [Int]) {
        // Hình vuông có 4 cạnh bằng nhau
        super.init(ten: "Vuông", soCanh: 1, thongTin: thongTin)
    }
    
    override func isHinh() -> Bool {
        super.isHinh()
        if self.thongTinCacCanh[0] == self.thongTinCacCanh[1] && self.thongTinCacCanh[1] == self.thongTinCacCanh[2] && self.thongTinCacCanh[2] == self.thongTinCacCanh[3] {
            return true
        } else {
            return false
        }
    }
    override func tinhDienTich() -> TinhToan {
        if isHinh() {
            return .laHinh(Double(self.thongTinCacCanh[0] * self.thongTinCacCanh[1]))
        } else {
            return .khongPhaiHinh
        }
    }
}

// Hình học 3 chiều
class BaChieu : HinhVe {
    
    func tinhTheTich() -> TinhToan {
        var ketQua = 1.0
        if isHinh() {
            for canh in super.thongTinCacCanh {
                ketQua *= Double(canh)
            }
            return .laHinh(ketQua)
        } else {
            return .khongPhaiHinh
        }
    }
}

class Cau : BaChieu {

    override init(ten: String, soCanh: Int, thongTin: [Int]) {
        super.init(ten: "Hình cầu", soCanh: 1, thongTin: thongTin)
    }
    
    override func tinhDienTich() -> TinhToan {
        if isHinh() {
            return .laHinh(4.0 * 3.14 * pow(Double(self.thongTinCacCanh[0]), 2.0))
        } else {
            return .khongPhaiHinh
        }
    }
    
    override func tinhTheTich() -> TinhToan {
        if isHinh() {
            return .laHinh( 4 / 3 * 3.14 * pow(Double(self.thongTinCacCanh[0]), 2.0))
        } else {
            return .khongPhaiHinh
        }
    }
}

class LapPhuong : BaChieu {
    
    override init(ten: String, soCanh: Int, thongTin: [Int]) {
        super.init(ten: "Lập phương", soCanh: 1, thongTin: thongTin)
    }
    
    override func tinhDienTich() -> TinhToan {
        if isHinh() {
            return .laHinh(6.0 * pow(Double(self.thongTinCacCanh[0]), 2.0))
        } else {
            return .khongPhaiHinh
        }
    }
    
    override func tinhTheTich() -> TinhToan {
        if isHinh() {
            return .laHinh(pow(Double(self.thongTinCacCanh[0]), 3.0))
        } else {
            return .khongPhaiHinh
        }
    }
}

//MARK: Kiểm tra kết quả
var tamGiac = TamGiac(ten: "tam giác", soCanh: 3, thongTin: [1,2,6])
let dienTich  = tamGiac.tinhDienTich()

switch dienTich {
case .khongPhaiHinh:
    print("Không phải hình tam giác")
case .laHinh(let dt):
    print("diện tích tam giác: \(dt)")
}


