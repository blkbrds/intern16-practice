import UIKit

func circle(r: Float) -> (Float, Float) {
    let pi : Float = 3.14159
    let V: Float = Float(3/4*r*r*r*pi)
    let S: Float = Float(4*r*r*pi)
    return (V,S)
}

let bankinh = 1.5
let result = circle (r: Float(bankinh))
print("Voi ban kinh la \(bankinh) thi Dien tich hinh cau la = \(result.1) & The tich hinh cau = \(result.0)")
