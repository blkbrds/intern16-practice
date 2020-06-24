import UIKit
import Foundation

enum Nghiem {
    case vonghiem
    case nghiemkep(x: Float)
    case hainghiem(x1: Float, x2: Float)
    case vosonghiem
}

func ptb2(hesoA a: Float,hesoB b: Float,hesoC c: Float) -> Nghiem{
    if a == 0 {
        if b == 0 {
            if c == 0 {
                return Nghiem.vosonghiem
            } else {
                return Nghiem.vonghiem
            }
        } else {
            return Nghiem.nghiemkep(x: -c / b)
        }
    } else {
        let delta = b * b - 4 * a * c
        if delta > 0 {
            let x1 = (-b+sqrt(delta))/(2*a)
            let x2 = (-b-sqrt(delta))/(2*a)
            return Nghiem.hainghiem(x1: x1, x2: x2)
        } else if delta == 0 {
            return Nghiem.nghiemkep(x: -b / (2 * a))
        } else {
            return Nghiem.vonghiem
        }
    }
}
var ketqua = ptb2(hesoA: 1, hesoB: 5, hesoC: 2)
switch ketqua{
    case Nghiem.vosonghiem:
        print("vo so nghiem")
    case Nghiem.vonghiem:
        print("vo nghiem")
    case Nghiem.nghiemkep(x: let ketqua):
        print("pt co nghiem kep: \(ketqua)")
    case Nghiem.hainghiem(x: let ketqua):
        print("pt co nghiem kep: \(ketqua.x1) va \(ketqua.x2)")
}
