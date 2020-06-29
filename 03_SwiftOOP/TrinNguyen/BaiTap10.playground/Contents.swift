import Foundation

class A{
    var n: Int
    init(n: Int) {
        self.n = n
    }
    func tinhTong() -> Int {
        var sum = 0
        for value in 1...n {
            sum += value
        }
        return sum
    }
    
}
let test = A(n: 2)
print(test.tinhTong())
