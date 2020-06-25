import UIKit
enum kq {
    case voNghiem
    case motNghiem(Float)
    case haiNghiem(Float,Float)
    case nghiemKep (Float)
   
}
func tinhPhuongTrinh( a: Double, b: Double, c:Double) -> kq {
    var x1 : Double = 0
    var x2 : Double = 0
    
    if a == 0 {
        if b == 0 {
            return kq.voNghiem
        } else {
            return kq.motNghiem(Float(-c/b))
        }
    }
    let delta : Float = Float((b * b)  - (a  * c * 4))
   
    if  delta < 0  {
        return kq.voNghiem
    }
    else if delta == 0  {
        return kq.nghiemKep((Float(-b / 2 * a)))
    }
    else if delta > 0 {
        x1 = (-b + sqrt(Double(delta))) / (2 * a)
        x2 = (-b - sqrt(Double(delta))) / (2 * a)
    }
    return kq.haiNghiem( Float(x1),Float( x2))
}
let ketQua = tinhPhuongTrinh(a: 1  , b: 4, c: 0)
switch ketQua {
case .voNghiem :
    print("phuong trinh vo nghiem")
case.motNghiem(let x):
    print("phuong trinh co 1 nghiem x = \(x)")
case .haiNghiem(let x1  , let x2 ):
    print("phuong trinh co  2 nghiem: x1 = \(x1) ; x2 = \(x2) ")

case .nghiemKep(let a):
    print("phuong trinh co nghiem kep: x1 = x2 = \(a)")
}

