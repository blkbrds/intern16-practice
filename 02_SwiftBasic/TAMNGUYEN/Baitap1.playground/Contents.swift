import UIKit


func hinhCau(r: Float) -> (v: Float, s: Float) {
    return (4.0 * Float.pi * r * r * r / 3, 4 * Float.pi * r * r)
}

let ketqua = hinhCau(r: 4)
print("V = \(ketqua.v) và S = \(ketqua.s)")
