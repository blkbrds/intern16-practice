import UIKit

struct A {
    func sum(_ n: Int) -> Int {
        var s = 0
        for i in 1...n {
            s += i
        }
        return s
    }
}

let a = A()
a.sum(8)
