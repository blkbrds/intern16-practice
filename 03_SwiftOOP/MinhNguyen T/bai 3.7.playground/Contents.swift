import UIKit

class HocSinh{
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
    
    func inten() -> String{
        hoten = nameHoa(name: hoten)
       return "\(hoten) , \(namsinh) ,\(tongdiem)"
    }
}

class dsHocSinh{
    var n:Int
    var dshocsinh: [HocSinh]
    
    init(n:Int, dshocsinh:[HocSinh]) {
        self.n = n
        self.dshocsinh = dshocsinh
    }
    
    // Sap xep giam dan tong diem
    // = diem -> nam sinh nho hownn dung truok
    func sapxep(){
        var hs:HocSinh
        for i in 0...n-1{
            for j in i+1...n{
                if dshocsinh[i].tongdiem < dshocsinh[j].tongdiem{
                    hs = dshocsinh[i]
                    dshocsinh[i] = dshocsinh[j]
                    dshocsinh[j] = hs
                    
                }else if dshocsinh[i].tongdiem == dshocsinh[j].tongdiem{
                    if dshocsinh[i].namsinh < dshocsinh[j].namsinh{
                        hs = dshocsinh[i]
                        dshocsinh[i] = dshocsinh[j]
                        dshocsinh[j] = hs
                    }
                }
            }
        }
    }
    
    func inDanhSach() {
        for i in 0..<n{
            print(dshocsinh[i].inten())
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

var ds = dsHocSinh(n: 3,dshocsinh: [ten1,ten2,ten3])
//ds.sapxep()
ds.inDanhSach()

