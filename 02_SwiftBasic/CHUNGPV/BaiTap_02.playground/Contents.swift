//import UIKit
import Foundation

enum KetQua{
    case vonghiem
    case hainghiem(Float, Float)
    case motnghiem(Float)
    case nghiemkep(Float)
}

func phuongtrinhbac2(a: Float, b: Float, c: Float) -> KetQua {
    if a == 0 {
        if b == 0 {
            return .vonghiem
        } else {
            return .motnghiem(-c / b)
        }
    }
    var x1 : Float
    var x2 : Float
    let delta : Float = b * b - 4 * a * c
    if delta > 0 {
        x1 = (-b + delta) / (2*a);
        x2 = (-b - delta) / (2*a);
        return .hainghiem(x1, x2)
    } else if delta == 0 {
        return .nghiemkep(-b / (2 * a))
    } else {
        return .vonghiem
    }
}

let kq = phuongtrinhbac2(a: 3, b: 4, c: 1)

switch kq {
case .vonghiem:
    print("Phuong trinh vo nghiem")
case .motnghiem(let x1):
    print("Phuong trinh 1 nghiem x: = \(x1)")
case .hainghiem(let x1, let x2):
    print("Phuong trinh co 2 nghiem x1= \(x1), x2 = \(x2)")
case .nghiemkep(let x):
    print("Phuong trinh co nghien kep x1 = x2 = \(x)")
}
