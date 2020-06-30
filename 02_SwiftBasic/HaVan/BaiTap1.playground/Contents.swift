import Foundation

let pi: Double = 3.14

func calculator(with radius: Double) -> (s: Double, v: Double) {
    let s = 4 * Double(pi) * pow(radius, 2)
    let v = (4 / 3) * ( Double(pi) * pow(radius, 3))
    return (s,v)
}

let resultSByString: String = String(format: "%.2f", calculator(with: 2).s)
let resultVByString: String = String(format: "%.2f", calculator(with: 2).v)
print("Diện tích hình cầu với đường kính 2 là : \(resultSByString)")
print("Thể tích hình cầu với đường kính 2 là : \(resultVByString)")
