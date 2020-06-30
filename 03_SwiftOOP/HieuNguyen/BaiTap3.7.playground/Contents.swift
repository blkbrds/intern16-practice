class HocSinh {
    var hoTen: String
    var namSinh: String
    var tongDiem: Float

    init(hoten: String,namsinh: String,tongdiem: Float) {
        self.hoTen = hoten
        self.namSinh = namsinh
        self.tongDiem = tongdiem
    }

}

func sapXep(mangHocSinh: [HocSinh]) -> [HocSinh] {
    let mangHocSinh: [HocSinh] = mangHocSinh
    let result: [HocSinh] = mangHocSinh.sorted { (hs0: HocSinh , hs1: HocSinh) -> Bool in
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

var hs1 = HocSinh(hoten: "Nguyen Quang hieu", namsinh: "1994", tongdiem: 5)
var hs2 = HocSinh(hoten: "Phan Ngoc khanh", namsinh: "1997", tongdiem: 7)
var hs3 = HocSinh(hoten: "Tran T K Anh", namsinh: "1995", tongdiem: 10)
var hs4 = HocSinh(hoten: "Tran T K Oanh", namsinh: "1996", tongdiem: 7)
var dsHs = sapXep(mangHocSinh: [hs1,hs4,hs3,hs2])

for hs in dsHs {
    print(hs.hoTen.firstUppercased)
}
