import Foundation
class Thu {
    var isDi: Bool
    
    init(isDi: Bool) {
        self.isDi = isDi
    }
    
    func getName() -> String {
        return ""
    }
}

class Chim {
    var isBay: Bool
    
    init(isBay: Bool) {
        self.isBay = isBay
    }
    
    func getName() -> String {
        return ""
    }
}

class Ca {
    var isBoi: Bool
    
    init(isBoi: Bool) {
        self.isBoi = isBoi
    }
    
    func getName() -> String {
        return ""
    }
}





@objc protocol P {
    func show()
    func add(a: Int, b: Int) -> Int
    @objc optional func sum(array: [Int]) -> Int
}

class C {
    var a: Int
    var b: Int
    var result: Int = 0
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}

extension C: P {
    func show() {
        print("result: \(result)")
    }
    
    func add(a: Int, b: Int) -> Int {
        result = a + b
        return a + b
    }
}
let c = C(a: 5, b: 10)

c.add(a: 15, b: 20)
c.show()
