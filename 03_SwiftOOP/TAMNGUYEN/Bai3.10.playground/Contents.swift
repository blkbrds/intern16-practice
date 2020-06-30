import UIKit
import Foundation

class A {
    var n: Int = 0
    init(n: Int) {
        self.n = n
    }
    
    func sumN(n: Int) -> Int {
        var sum: Int = 0
        for index in 1...n {
            sum += index
        }
        return sum
    }
}
let a = A(n: 5)
a.sumN(n: 5)


