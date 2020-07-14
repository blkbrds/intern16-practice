import Foundation

enum NghiemHe {
    case HeVoNghiem
    case HeVoSoNghiem
    case HeCoNghiem(x: Double, y: Double)
}

func giaihe(a1 : Int, b1: Int, c1: Int, a2: Int, b2: Int, c2: Int) -> NghiemHe {
    let d: Int = a1 * b2 - a2 * b1
    let dx: Int = c1 * b2 - c2 * b1
    let dy: Int = c1 * a2 - a2 * c1
    if d == 0 {
        if dx == 0 && dy == 0 {
            return .HeVoSoNghiem
        } else {
            return .HeVoNghiem
        }
    } else {
        return .HeCoNghiem(x: Double(dx / d), y: Double(dy / d))
    }
}

//MARK: kiểm tra kết quả
let ketQua: NghiemHe = giaihe(a1: 0, b1: 0, c1: 0, a2: 0, b2: 0, c2: 0)

switch ketQua {
case .HeVoNghiem:
    print("Hệ vô nghiệm")
case .HeVoSoNghiem:
    print("Hệ vô số nghiệm")
case .HeCoNghiem(x: let x, y: let y):
    print("Hệ có nghiệm : x = \(x) và y = \(y)")
}
