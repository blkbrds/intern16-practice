import UIKit

func tinhDienTichVaTheTich (r: Float) -> (Float, Float) {
    let pi = Float.pi
    let s = 4 * pi * r * r
    let v = (4 / 3) * pi * r * r * r
    return (s, v)
}
print("Dien tich la: \(tinhDienTichVaTheTich(r: 1).0) va The tich la \(tinhDienTichVaTheTich(r: 1).1)")
