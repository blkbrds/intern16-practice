import UIKit

class CStack {
    var array: [Int] = []
    var capacity: Int = 5
    
    init (array: [Int], capacity: Int) {
        self.array = array
        self.capacity = capacity
    }

    func isEmpty () -> Bool {
        return self.array.isEmpty
    }

    func isFull () -> Bool {
        guard self.array.count > capacity else {
            return false
        }
        return true
    }

    func add (newElement: Int) {
        return self.array.append(newElement)
    }

    func del () -> Int? {
        return self.array.popLast()
    }

    func count () -> Int {
        return self.array.count
    }
}

var array1 = CStack(array: [], capacity: 5)

print("Kiem tra stack rong: \(array1.isEmpty())")

print("Them phan tu vao stack")
array1.add(newElement: 1)
array1.add(newElement: 2)
array1.add(newElement: 3)
array1.add(newElement: 5)

print("So phan tu sau khi them: \(array1.count())")

print("Xoa phan tu trong stack")
array1.del()

print("So phan tu sau khi xoa: \(array1.count())")
print("Kiem tra stack rong? \(array1.isEmpty())")
print("Kiem tra stack full? \(array1.isFull())")
