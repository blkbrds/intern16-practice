import UIKit

var str = "Hello, playground"
class A {
     var n: Int
    init(n: Int) {
        self.n = n
    }
    func sumA() -> Int {
        var sum = 0
        for i in 1...n {
            sum += i
        }
        return sum
    }
}

var n = A(n: 10)
print("Tong S tu 1 den n la: \(n.sumA())")
