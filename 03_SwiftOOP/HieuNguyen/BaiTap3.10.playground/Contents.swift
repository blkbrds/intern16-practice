class A {
    func tong(n: Int) -> Int {
        var sum = 0
        for i in 0..<n {
            sum += i
        }
        return sum
    }
}
var kq = A().tong(n: 10)
