import UIKit

class CStack {
    var phanTu: Int
    var stacks: [Int] = []

    init(phanTu: Int) {
        self.phanTu = phanTu
    }

    func isEmpty() -> Bool {
        return stacks.isEmpty
    }

    func isFull() -> Bool {
        return stacks.count == phanTu
    }

    func add(pt: Int) -> [Int] {
        if stacks.count < phanTu {
            stacks.append(pt)
        }
        return stacks
    }

    func removeLast() -> [Int] {
        if !stacks.isEmpty {
            stacks.remove(at: stacks.count-1)
        }
        return stacks
    }
}

var temps = CStack.init(phanTu: 4)
temps.add(pt: 1)
temps.add(pt: 2)
temps.add(pt: 5)
temps.add(pt: 3)
temps.add(pt: 8)
temps.removeLast()
