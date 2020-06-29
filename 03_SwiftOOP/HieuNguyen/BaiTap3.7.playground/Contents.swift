import UIKit

class hocSinh {
    var hoTen: String
    var namSinh: String
    var tongDiem: Float

    init(hoten: String,namsinh: String,tongdiem: Float) {
        self.hoTen = hoten
        self.namSinh = namsinh
        self.tongDiem = tongdiem
    }

}

func sapxep(mangHocSinh: [hocSinh]) -> [hocSinh]{
    let mangHocSinh: [hocSinh] = mangHocSinh
    var result: [hocSinh] = mangHocSinh.sorted { (hs0: hocSinh , hs1: hocSinh) -> Bool in
        if hs0.tongDiem > hs1.tongDiem {
            return true
        }
        if hs0.tongDiem == hs1.tongDiem {
            return hs0.namSinh > hs1.namSinh
        }
        return false
    }
    return result
}

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
}

var hs1 = hocSinh(hoten: "Nguyen Quang hieu", namsinh: "1994", tongdiem: 5)
var hs2 = hocSinh(hoten: "Phan Ngoc khanh", namsinh: "1997", tongdiem: 7)
var hs3 = hocSinh(hoten: "Tran T K Anh", namsinh: "1995", tongdiem: 10)
var hs4 = hocSinh(hoten: "Tran T K Oanh", namsinh: "1996", tongdiem: 7)

var dsHs = sapxep(mangHocSinh: [hs1,hs4,hs3,hs2])

for hs in dsHs {
    print(hs.hoTen.firstUppercased)
}
