import UIKit
import Foundation
let pi:Float = 3.14
func calculator(with radius: Double) -> (Double, Double) {
    let s = 4 * Double(pi) * pow(radius, 2)
    let v = (4 / 3) * ( Double(pi) * pow(radius, 3))
    
    return (s,v)

}

let resultSByString = String(format: "%.2f", calculator(with: 2).0)
let resultVByString = String(format: "%.2f", calculator(with: 2).1)
print("Diện tích hình cầu với đường kính 2 là : \(resultSByString)")
print("Thể tích hình cầu với đường kính 2 là : \(resultVByString)")
