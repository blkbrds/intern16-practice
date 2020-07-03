import UIKit
import Foundation

class HocSinh {
    var hoten: String
    var namsinh: Int
    var tongdiem: Float
    
    init(hoten: String, namsinh: Int, tongdiem: Float) {
        self.hoten = hoten
        self.namsinh = namsinh
        self.tongdiem = tongdiem
    }
    
    //chuyen chu cai dau ho ten thanh chu hoa
    func nameHoa(name: String) -> String {
        return hoten.capitalizingFirstLetter()
    }
    
    func inten() -> String {
        hoten = nameHoa(name: hoten)
       return "\(hoten) , \(namsinh) ,\(tongdiem)"
    }
}

class danhsachHocSinh {
    var danhsachhocsinh: [HocSinh]
    
    init(danhsachhocsinh:[HocSinh]) {
        self.danhsachhocsinh = danhsachhocsinh
    }
    
    // Sap xep giam dan tong diem
    // = diem -> nam sinh nho hownn dung truok
    func sapxep(){
        var hs:HocSinh
        for i in 0...danhsachhocsinh.count - 1 {
            for j in i+1...danhsachhocsinh.count {
                if danhsachhocsinh[i].tongdiem < danhsachhocsinh[j].tongdiem{
                    hs = danhsachhocsinh[i]
                    danhsachhocsinh[i] = danhsachhocsinh[j]
                    danhsachhocsinh[j] = hs
                }else if danhsachhocsinh[i].tongdiem == danhsachhocsinh[j].tongdiem{
                    if danhsachhocsinh[i].namsinh < danhsachhocsinh[j].namsinh{
                        hs = danhsachhocsinh[i]
                        danhsachhocsinh[i] = danhsachhocsinh[j]
                        danhsachhocsinh[j] = hs
                    }
                }
            }
        }
    }
    
    func inDanhSach() {
        for i in 0..<danhsachhocsinh.count {
            print(danhsachhocsinh[i].inten())
        }
    }
}

// ham them - tao chu cai hoa dau

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

var ten1 = HocSinh(hoten: "minh", namsinh: 1997, tongdiem: 7)
var ten2 = HocSinh(hoten: "hao", namsinh: 1998, tongdiem: 7.6)
var ten3 = HocSinh(hoten: "nam", namsinh: 1999, tongdiem: 9)

var ds = danhsachHocSinh(danhsachhocsinh: [ten1,ten2,ten3])
//ds.sapxep()
ds.inDanhSach()

