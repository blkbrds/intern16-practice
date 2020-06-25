import UIKit

// Tinh dien tich & the tich hinh
func hinhCau(radius: Double) -> (Double, Double) {
    let s = 4 * Double(Float.pi) * pow(radius, 2)
    let v = (4 / 3) * ( Double(Float.pi) * pow(radius, 3))
    
    return (s,v)
}
