import UIKit
import Foundation

enum nghiem {
    case vonghiem
    case vosonghiem
    case motnghiem(Float, Float)
}

func hePTbacnhat(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> nghiem {
    var d: Float = 0, dx: Float = 0, dy: Float = 0
    var x: Float = 0, y: Float = 0

    d = a1 * b2 - a2 * b1
    dx = c1 * b2 - c2 * b1
    dy = a1 * c2 - a2 * c1

    if d != 0 {
        x = dx / d
        y = dy / d
        return .motnghiem(x, y)
    }
    else if dx != 0 {
        return .vonghiem
    }
    else {
        return .vosonghiem
    }
}

let a1: Float = 3, b1: Float = -2, c1: Float = 11
let a2: Float = 4, b2: Float = -5, c2: Float = 3

print("Giai he phuong trinh bac nhat 2 an")
print("\(a1)x + \(b1)y = \(c1)")
print("\(a2)x + \(b2)y = \(c2)")

let result = hePTbacnhat(a1: a1, b1: b1, c1: c1, a2: a2, b2: b2, c2: c2)

switch result {
case .vonghiem:
    print("He phuong trinh vo nghiem.")
case .vosonghiem:
    print("He phuong trinh co vo so nghiem.")
case .motnghiem(let x, let y):
    print(" He phuong trinh co nghiem duy nhat (x,y) = (\(x),\(y))")
}
