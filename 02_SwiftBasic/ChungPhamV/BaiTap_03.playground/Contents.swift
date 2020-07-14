import Foundation

enum KetQua{
    case vonghiem
    case hainghiem(Float, Float)
    case vosonghiem
}
func bacNhat2An(a1: Int, b1: Int, c1: Int, a2: Int, b2: Int, c2: Int ) -> KetQua{
    let d: Float =  Float(a1 * b2 - a2 * b1)
    let dx: Float = Float(c1 * b2 - c2 * b1)
    let dy: Float = Float(a1 * c2 - a2 * c1)
    var x: Float
    var y: Float
    if d==0 {
        if (dx + dy)==0 {
            return .vosonghiem
        } else {
            return .vonghiem
        }
    } else {
        x = dx/d
        y = dx/d
        return .hainghiem(x, y)
    }
}
let kq = bacNhat2An(a1: 2, b1: 3, c1: 5, a2: 2, b2: -1, c2: 1)

switch kq {
case .vonghiem:
    print("Phuong trinh vo nghiem")
case .hainghiem(let x, let y):
    print("Phuong trinh co 2 nghiem x= \(x), y = \(y)")
case .vosonghiem:
    print("Phuong trinh co vo so nghiem")
}
