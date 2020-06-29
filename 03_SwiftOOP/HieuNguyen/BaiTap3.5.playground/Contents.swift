import UIKit

class CStack {
    var phanTu: Int
    var stack: [Int] = []

    init(phanTu: Int) {
        self.phanTu = phanTu
    }

    func isEmpty() -> Bool {
        return stack.count == 0
    }

    func isFull() -> Bool {
        return stack.count == phanTu
    }

    func add(pt: Int) -> [Int] {
        if stack.count < phanTu {
            stack.append(pt)
        }
        return stack
    }

    func removeLast() -> [Int] {
        if !stack.isEmpty {
            stack.remove(at: stack.count-1)
        }
        return stack
    }
}
var temps = CStack.init(phanTu: 4)
temps.add(pt: 1)
temps.add(pt: 2)
temps.add(pt: 5)
temps.add(pt: 3)
temps.add(pt: 8)
temps.removeLast()
