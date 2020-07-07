import Foundation

class Stack {
    var capacity: Int
    var array = [Int]()

    init(capacity: Int, array: [Int]) {
        self.capacity = capacity
        self.array = array
    }

    func checkEmpty() -> Bool {
        array.isEmpty
    }

    func checkFull() -> Bool {
        return array.count == capacity
    }

    func addArray(temp: Int) -> Array<Int> {
        if checkFull() == true {
            print("Stack is full !!!")
        } else {
            array.append(temp)
        }
        return array
    }

    func remove() -> Array<Int?> {
        array.popLast()
        return array
    }
}

let test = Stack(capacity: 2, array: [1, 2])
    if test.checkEmpty() == true {
        print("Stack is empty!!!")
    }
    test.addArray(temp: 2)
