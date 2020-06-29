import UIKit

class CStack{
    var stack:[Int] = []
    var capacity:Int
    init(capacity: Int, stack:[Int]) {
        self.capacity = capacity
        self.stack = stack
    }
    func inStack(){
        print(stack)
    }
    // Kiểm tra stack rỗng
    func isEmty() -> Bool {
        return stack.isEmpty
    }
    
    // Kiểm tra stack đâỳ
    func isFull() -> Bool {
        return stack.count >= capacity
    }
    
    // Them phan tu trong stack
    func pushElement(element: Int){
        guard isFull() else { return }
        stack.append(element)
    }
    
    //xoa phan tu dau tien o dinh
    // optinal string trường hợp stack rỗng
    func popTop()-> Int?{
        return stack.popLast()
    }
}

var st = CStack(capacity: 0,stack: [])
//st.pushElement(element: 8)
//st.inStack()
//st.popTop()
//st.inStack()
