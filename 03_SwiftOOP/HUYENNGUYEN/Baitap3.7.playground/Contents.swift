import UIKit

class HocSinh {
    let hoTen: String
    let namSinh: Int
    let tongDiem: Float

    init(hoTen: String, namSinh: Int, tongDiem: Float) {
        self.hoTen = hoTen.chuyenHoa()
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }

    func toString() -> String {
        return "Ho Ten: \(hoTen), sinh nam: \(namSinh), tong diem: \(tongDiem)"
    }
}

extension String {
    func chuyenHoa() -> String {
        let hoTen: String = self
        //chuyen string sang chuoi
        var hoTenArray: [Character] = Array(hoTen)
        //in hoa chu dau
        hoTenArray[0] = Character(hoTenArray[0].uppercased())
        //in hoa truoc dau cach
        for i in 1..<hoTenArray.count where hoTenArray[i - 1] == " " {
            hoTenArray[i] = Character(hoTenArray[i].uppercased())
        }
        return String(hoTenArray)
    }
}

extension Array where Element: HocSinh {
    func sapXepHocSinh() -> [HocSinh] {
        var dsHocSinh: [HocSinh] = self
        
        //sort
        dsHocSinh.sort { (hocSinhA, hocSinhB) -> Bool in
            if hocSinhA.tongDiem == hocSinhB.tongDiem {
                return hocSinhA.namSinh < hocSinhB.namSinh
            } else {
                return hocSinhA.tongDiem > hocSinhB.tongDiem
            }
        }

        return dsHocSinh
    }

    func inDanhSach() {
        let dsHocSinh: [HocSinh] = self
        for i in 0..<dsHocSinh.count {
            print(dsHocSinh[i].toString())
        }
    }
}

var hocSinh: [HocSinh] = []
hocSinh.append(HocSinh(hoTen: "nguyen van a", namSinh: 1998, tongDiem: 1.2))
hocSinh.append(HocSinh(hoTen: "nguyen van B", namSinh: 1998, tongDiem: 2))
hocSinh.append(HocSinh(hoTen: "nguyen van a c", namSinh: 1998, tongDiem: 9.99))

var dsHocSinh = hocSinh.sapXepHocSinh()
dsHocSinh.inDanhSach()
