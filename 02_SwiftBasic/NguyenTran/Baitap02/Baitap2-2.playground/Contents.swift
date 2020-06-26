import UIKit
import Foundation

enum nghiem {
    case vosonghiem
    case vonghiem
    case motnghiem(Float)
    case hainghiem(Float,Float)
}

func ptbac2(a:Float, b:Float, c:Float) -> nghiem {
    if a == 0 {
        if b == 0 {
            if c == 0 {
                return .vosonghiem
            }
            else {
                return .vonghiem
            }
        }
        else {
            return .motnghiem((-c)/b)
        }
    }
    else {
        let delta:Float = b*b-4*a*c
        if delta < 0 {
            return .vonghiem
        }
        else if delta == 0 {
            return .motnghiem((-b)/(2*a))
        }
        else {
            let sq: Float = sqrtf(delta)
            let x1:Float = (-b+sq)/(2*a)
            let x2:Float = (-b-sq)/(2*a)
            return .hainghiem(x1, x2)
        }
    }
}

let a:Float = 1, b:Float = 4, c:Float = 3

switch ptbac2(a:a, b:b, c:c) {
case .vosonghiem:
    print("Phuong trinh co nghiem voi moi x.")
case .vonghiem:
    print("Phuong trinh vo nghiem.")
case .motnghiem(let x):
    print("Phuong trinh co 1 nghiem la x=\(x).")
case .hainghiem(let x1, let x2):
    print("Phuong trinh co 2 nghiem la x1=\(x1) va x2=\(x2).")
}
