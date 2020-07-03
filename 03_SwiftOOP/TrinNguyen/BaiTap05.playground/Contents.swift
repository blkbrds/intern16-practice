import Foundation

class Stack {
    var capacity: Int
    var arr = [Int]()

    init(capacity: Int, arr: [Int]) {
        self.capacity = capacity
        self.arr = arr
    }

    func checkEmpty() -> Bool {
        if arr.count == 0 {
            return true
        }
        else {
            return false
        }
    }

    func checkFull() -> Bool {
        return arr.count == capacity
    }

    func addArray(temp: Int) -> Array<Int> {
        if checkFull() == true {
            print("Stack is full !!!")
        } else {
            arr.append(temp)
        }
        return arr
    }

    func remove() -> Array<Int?> {
        arr.popLast()
        return arr
    }
}

let test = Stack(capacity: 2, arr: [1, 2])
    if test.checkEmpty() == true {
        print("Stack is empty!!!")
    }
    test.addArray(temp: 2)
