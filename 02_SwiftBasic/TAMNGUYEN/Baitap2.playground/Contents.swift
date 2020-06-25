import UIKit
// giai phuong trinh bac 2
func denta(a: Float, b: Float, c: Float) -> Float {
    return Float(b * b - 4 * a * c)
}

func tinhNghiem(a : Float,b : Float,c : Float) -> (n1: Float, n2: Float) {
    return (Float(-b - sqrt(a) / ( 2 * a)), Float(-b + sqrt(a) / ( 2 * a)))
}
func tinhnghiemKep(a: Float,b : Float,c : Float) -> Float {
    return Float(-b / (2 * a))
}
let del = denta(a: 2,b: 4,c: -6)
if del < 0 {
    print("Phuong trinh vo nghiem")
}
if del == 0 {
    print("Phuong trinh co nghiem kep: \(tinhnghiemKep(a: 1,b: 2,c: -3))")
}
if del > 0 {
    print("Phuong trinh co 2 nghiem : \(tinhNghiem(a: 1,b: 2,c: -3))")}
	



