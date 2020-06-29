import Foundation

enum Nghiem {
    case voNghiem
    case nghiemKep(x: Float)
    case haiNghiem(x1: Float, x2: Float)
    case voSoNghiem
}

func giaiPtb2(hesoA a: Float, hesoB b: Float, hesoC c: Float) -> Nghiem {
    if a == 0 {
        if b == 0 {
            if c == 0 {
                return .voSoNghiem
            } else {
                return .voNghiem
            }
        } else {
            return .nghiemKep(x: -c / b)
        }
    } else {
        let delta = b * b - 4 * a * c
        if delta > 0 {
            let x1 = (-b + sqrt(delta)) / (2 * a)
            let x2 = (-b - sqrt(delta)) / (2 * a)
            return .haiNghiem(x1: x1, x2: x2)
        } else if delta == 0 {
            return .nghiemKep(x: -b / (2 * a))
        } else {
            return .voNghiem
        }
    }
}

var ketqua = giaiPtb2(hesoA: 1, hesoB: 5, hesoC: 2)

switch ketqua {
    case .voSoNghiem:
        print("vo so nghiem")
    case .voNghiem:
        print("vo nghiem")
    case .nghiemKep(let ketqua):
        print("pt co nghiem kep: \(ketqua)")
case .haiNghiem(ketqua: let ketqua):
        print("pt co nghiem kep: \(ketqua.x1) va \(ketqua.x2)")
}
