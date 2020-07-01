import Foundation

class HocSinh {
    var hoTen: String
    var namSinh: Int
    var tongDiem: Float

    init(hoTen: String, namSinh: Int, tongDiem: Float) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
}

class DanhSachHocSinh {
    var danhSach: [HocSinh]
    
    init(danhSach: [HocSinh]) {
        self.danhSach = danhSach
    }
    
    func sapXep() -> [HocSinh] {
        danhSach.sort { (hs1: HocSinh, hs2: HocSinh) -> Bool in
             if hs1.tongDiem > hs2.tongDiem {
                return true
            } else if hs1.tongDiem == hs2.tongDiem {
                return hs1.namSinh > hs2.namSinh
            } else {
                return false
            }
        }
        for hs in danhSach {
            hs.hoTen = hs.hoTen.capitalized
            print(hs.hoTen)
        }
        return danhSach
    }
    
    func inDanhSach(ds : [HocSinh]) -> String {
        var ketQua = ""
        for hs in danhSach {
            ketQua += "\(hs.hoTen) - \(hs.namSinh) - \(hs.tongDiem) ; "
        }
        return ketQua
    }
}

extension StringProtocol {
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
//MARK: kiểm tra kết quả

var hs1 = HocSinh(hoTen: "trần thị nguyệt", namSinh: 1997, tongDiem: 7.8)
var hs2 = HocSinh(hoTen: "văn Hồ ngân Hà", namSinh: 1997, tongDiem: 6.5)
var hs3 = HocSinh(hoTen: "nguyễn thị ngọc", namSinh: 1993, tongDiem: 4.7)
var hs4 = HocSinh(hoTen: "Ngô thị hồng châu", namSinh: 1998, tongDiem: 9.0)

var danhSach = DanhSachHocSinh(danhSach: [hs1,hs2,hs3,hs4])
print("danh sách học sinh sắp xếp theo điểm: \(danhSach.inDanhSach(ds: danhSach.sapXep()))")



