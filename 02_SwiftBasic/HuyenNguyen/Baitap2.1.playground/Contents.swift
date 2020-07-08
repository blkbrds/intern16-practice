import Foundation

func calculatorSphere(r: Float) -> (s: Float, v: Float) {
    let s = 4 * Float.pi * pow(r, 2)
    let v = (4 / 3) * Float.pi * pow(r, 2)
    return (s, v)
}

print("Diện tích: \(calculatorSphere(r: 2.5).s) \nThể tích: \(calculatorSphere(r: 2.5).v)")
