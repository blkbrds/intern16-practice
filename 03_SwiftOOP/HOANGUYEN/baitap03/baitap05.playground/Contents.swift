import UIKit

class CStack {
    
    var arr: Array<Int>
    var cap: Int
    
    init(arrStack: Array<Int>) {
        self.arr = arrStack
        self.cap = 10
    }
    
    func checkEmpty() -> Bool{
        return arr.count == 0
    }
    
    func checkFull() -> Bool{
        return arr.count == cap
    }
    func addElement(element: Int) -> Array<Int> {
        if checkFull() {
            print("Stack đầy")
        }
        else {
            arr.append(element)
        }
        return arr
    }
    func removeTop() -> Array<Int> {
        arr.removeLast()
        return arr
    }
}



