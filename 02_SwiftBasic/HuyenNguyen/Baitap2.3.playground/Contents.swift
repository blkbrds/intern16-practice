import Foundation

enum Nghiem {
    case voSoNghiem
    case voNghiem
    case haiNghiem(x: Float, y: Float)
}

func giaiHePhuongTrinh(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> Nghiem {
    let d: Float = a1 * b2 - a2 * b1
    let dx: Float = c1 * b2 - c2 * b1
    let dy: Float = a1 * c2 - a2 * c1
    if d == 0 && dx + dy == 0 {
        return .voSoNghiem
    } else if d == 0 { return .voNghiem }
    else {
        return .haiNghiem(x: Float(dx / d), y: Float(dy / d))
    }
}

let ketQua: Nghiem = giaiHePhuongTrinh(a1: 0, b1: 0, c1: 1, a2: 0, b2: 0, c2: 0)

switch ketQua {
case .voNghiem:
    print("pt vo nghiem")
case .voSoNghiem:
    print("pt vo so nghiem")
case .haiNghiem(ketqua: let ketqua):
 print("Hệ có nghiệm : x = \(ketqua) và y = \(ketqua)")
}
