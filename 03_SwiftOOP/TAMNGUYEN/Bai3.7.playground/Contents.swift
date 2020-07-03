import Foundation

class HocSinh {
    var hoTen: String = ""
    var namSinh: Int = 0
    var tongDiem: Float = 0.0
    
    init(hoTen: String, namSinh: Int, tongDiem: Float) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
}

func sapXep(manghs: [HocSinh]) -> [HocSinh] {
    let manghs: [HocSinh] = manghs
    var ketqua: [HocSinh] = manghs.sorted { (hs0: HocSinh, hs1: HocSinh) -> Bool in
        if hs0.tongDiem > hs1.tongDiem {
            return true
        }
        if hs0.namSinh == hs1.namSinh {
            hs0.namSinh > hs1.namSinh
        }
        return false
    }
    return ketqua
}


var hs1 = HocSinh(hoTen: "Tam", namSinh: 97, tongDiem: 10)
var hs2 = HocSinh(hoTen: "An", namSinh: 96, tongDiem: 7)
var hs3 = HocSinh(hoTen: "Bao", namSinh: 93, tongDiem: 8)
var hs4 = HocSinh(hoTen: "Ha", namSinh: 80, tongDiem: 1)
var hs5 = HocSinh(hoTen: "Yen", namSinh: 96, tongDiem: 7)

let danhsach = sapXep(manghs: [hs1, hs2, hs3, hs4, hs5])



