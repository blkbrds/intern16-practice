import UIKit

enum Nghiem {
    case voSoNghiem
    case voNghiem
    case haiNghiem(x: Float, y: Float)
}

func giaiHptb2(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> Nghiem {
    let d: Float  = a1 * b2 - a2 * b1
    let dx: Float = c1 * b2 - c2 * b1
    let dy: Float = a1 * c2 - a2 * c1
    if d == 0 {
        if dx + dy == 0 {
            return .voSoNghiem
        } else {
            return .voNghiem
        }
     } else {
        let x: Float = dx / d
        let y: Float = dy / d
        return .haiNghiem(x: x, y: y)
     }
}

let ketQua = giaiHptb2(a1: 2, b1: 1, c1: 4, a2: 3, b2: 2, c2: 7)

switch ketQua {
case .voNghiem:
    print("pt vo nghiem")
case .voSoNghiem:
    print("pt vo so nghiem")
case .haiNghiem(ketqua: let ketqua):
    print("pt co 2 nghiem : \(ketqua.0) va \(ketqua.1)")
}
