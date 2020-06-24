import UIKit
enum Nghiem {
    case vosonghiem
    case vonghiem
    case hainghiem(x: Float, y: Float)
}
func hptb2(a1: Float,b1: Float,c1: Float,a2: Float,b2: Float,c2: Float) -> Nghiem{
    let D:Float  = a1 * b2 - a2 * b1
    let Dx:Float = c1 * b2 - c2 * b1
    let Dy:Float = a1 * c2 - a2 * c1
    if (D == 0) {
        if Dx + Dy == 0 {
            return .vosonghiem
        } else {
            return .vonghiem
        }
     } else {
        let x:Float = Dx / D
        let y:Float = Dy / D
        return .hainghiem(x: x, y: y)
     }
}
let ketqua = hptb2(a1: 2, b1: 1, c1: 4, a2: 3, b2: 2, c2: 7)
switch ketqua {
case .vonghiem:
    print("pt vo nghiem")
case .vosonghiem:
    print("pt vo so nghiem")
case .hainghiem(ketqua: let ketqua):
    print("pt co 2 nghiem : \(ketqua.0) va \(ketqua.1)")
}
