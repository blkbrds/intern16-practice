import Foundation

struct A {
    var n: Int = 0
    
    func sum() -> Int {
        if n < 0 {
            print("Error: Nhập số n lớn hơn hoặc bằng 0\n")
            return 0
        } else {
            var sum = 0
            for i in 0...n {
                sum += i
            }
            return sum
        }
    }
}
let a = A(n:10)
let result = a.sum()

print("Kết quả của phép cộng A = 1+2+...+n với n = \(a.n) là \(result)")
