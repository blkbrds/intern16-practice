import UIKit

func tinhDienTichVaTheTich (r: Float) -> (s: Float,v: Float) {
    let pi = Float.pi
    let s = 4 * pi * pow(r, 2)
    let v = (4 / 3) * pi * pow(r, 2)
    return (s, v)
}

print("Dien tich la: \(tinhDienTichVaTheTich(r: 1).s) va The tich la \(tinhDienTichVaTheTich(r: 1).v)")
