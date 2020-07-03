import UIKit


class A {
     var a: Int
    init(a: Int) {
        self.a = a
    }
    func sumA() -> Int {
        var sum = 0
        for i in 1...a {
            sum += i
        }
        return sum
    }
}

var a = A(a: 15)
print("Tong S tu 1 den a la: \(a.sumA())")
