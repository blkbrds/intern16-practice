import UIKit

class CStack {
    var arrStack : [Int]  = [1,2,3,4]
    var maxStack = 5
    func isEmpty() -> Bool {
        return arrStack.isEmpty
    }
    func isFull() -> Bool {
        return arrStack.count == maxStack
    }
    func addElement (element : Int)  {
        if  !isFull() {
            arrStack.append(element)
        } else {
            print("stack was full")
        }
       
    }
    func pop() -> Int? {
        return arrStack.popLast()
    }
}

var a = CStack()
a.isEmpty()
a.isFull()
a.addElement(element: 5)
a.addElement(element: 6)
a.addElement(element: 7)
print(a.arrStack)
a.pop()
print(a.arrStack)







