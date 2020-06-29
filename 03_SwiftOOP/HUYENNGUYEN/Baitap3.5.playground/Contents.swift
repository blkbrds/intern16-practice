import UIKit

class CStack<e> {
    fileprivate var array: [e] = []

    func isEmpty() -> Bool {
        return self.array.isEmpty
    }

    func isFull(numberElements: Int) -> Bool {
        return self.array.count >= numberElements - 1 ? true : false
    }
    //them
    func push(_ element: e) {
        return self.array.append(element)
    }
    //xoa
    func pop() -> e? {
        return self.array.popLast()
    }
    //dem
    func count() -> Int {
        return array.count
    }
}

var cstack = CStack<Int>()
print("Kiểm tra Stack rỗng? \(cstack.isEmpty())")
cstack.push(2)
cstack.push(1)
cstack.push(5)
cstack.push(2)
cstack.push(7)
cstack.push(9)
print("Số phần tử sau thêm: \(cstack.count())")
cstack.pop()
print("Số phần tử sau xoá: \(cstack.count())")
print("Kiểm tra Stack rỗng? \(cstack.isEmpty())")
