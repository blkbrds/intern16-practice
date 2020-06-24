import UIKit

enum kq {
    case voSoNghiem
    case voNghiem
    case haiNghiem( Double, Double)
}


//
func giaiPtBacNhat2An ( a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2:Double) -> kq {
    let D = a1 * b2 - a2 * b1
    let DX = c1 * b2 - c2 * b1
    let DY = a1 * c2 - a2 * c1
    if D == 0 {
        if DX + DY == 0 {
            return kq.voSoNghiem
        }
        else {
            return .voNghiem
        }
        
    }
    else {
        let x = DX / D
        let y = DY / D
        
        return kq.haiNghiem(x, y)
    }
}
let a1 : Double = 8
let b1 : Double = 4
let c1 : Double = 12
let a2 : Double = 7
let b2 : Double = 6
let c2 : Double = 46

let result = giaiPtBacNhat2An(a1: a1, b1: b1, c1: c1, a2: a2, b2: b2, c2: c2)

switch result {
case .voNghiem:
    print("phuong trinh co vo nghiem")

case .voSoNghiem :
    print("phuong trinh co vo so nghiem")
case .haiNghiem(let x , let y) :
    print("phuong trinh co 2 nghiem: \(x) va \(y)")
}
