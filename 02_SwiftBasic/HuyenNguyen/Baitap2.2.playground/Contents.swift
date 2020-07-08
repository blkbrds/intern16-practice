import UIKit

//enum
enum NghiemPhuongTrinh {
    case PTVoNghiem
    case PTVoSoNghiem
    case PTCo1Nghiem(x: Double)
    case PTCo2Nghiem(x1: Double, x2: Double)
}

//xet phuong trinh bac 1
func phuongTrinhBac1( a: Float, b: Float) -> NghiemPhuongTrinh {
    if a == 0 {
        if b != 0 {
            return .PTVoNghiem
        } else {
            return .PTVoSoNghiem
        }
    } else if b == 0 {
        return .PTCo1Nghiem(x: 0)
    } else {
        return .PTCo1Nghiem(x: Double(-b / a))
    }
}

//xet phuong trinh bac 2
func phuongTrinhBac2( a: Float, b: Float, c: Float) -> NghiemPhuongTrinh {
    if a == 0 {
        return phuongTrinhBac1(a: b, b: c)
    } else if b == 0 && c == 0 {
        return .PTCo1Nghiem(x: 0)
    } else if b == 0 && c != 0 {
        let x = -c / a
        return .PTCo2Nghiem(x1: (sqrt(Double(x))), x2: -(sqrt(Double(x))))
    } else {
        let delta = pow(Double(b), 2) - 4*Double(a * c)
        switch delta {
        case ...0:
            return .PTVoNghiem
        case 0 :
            return .PTCo2Nghiem(x1: -Double(b)/Double(2 * a), x2: -Double(b)/Double(2 * a))
        default:
            return .PTCo2Nghiem(x1: -Double(b) + sqrt(delta) / Double(2 * a), x2: -Double(b) - sqrt(delta) / Double(2 * a))
        }
    }
}

let ketQua = phuongTrinhBac2(a: 1, b: 3, c: 1)

switch ketQua {
case .PTVoNghiem:
    print("Phương trình vô nghiệm")
case .PTVoSoNghiem:
    print("Phương trình vô số nghiệm")
case .PTCo1Nghiem(x: let x):
    print("Phương trình có 1 nghiệm x= \(x)")
case .PTCo2Nghiem(x1: let x1, x2: let x2):
    print("Phương trình có 2 nghiệm phân biệt: x1 = \(x1) , x2 = \(x2)")
}
