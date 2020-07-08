import Foundation

class CStack {
    var size: Int
    var stack: Array<Int>

    init(size: Int, stack: [Int]) {
        if size <= 0 {
            print("Error: Size của Stack phải lớn hơn hoặc bằng 0")
            self.size = 0
            self.stack = []
        } else if size < stack.count {
            print("Error: Stack đang nhập vào có nhiều phần tử hơn size được cấp.")
            self.size = 0
            self.stack = []
        } else {
            self.size = size
            self.stack = stack
        }
    }

    func isFull() -> Bool {
        if size <= stack.count {
            return true
        } else {
            return false
        }
    }

    func isEmpty() -> Bool {
        if stack.count == 0 {
            return true
        } else {
            return false
        }
    }

    func add(element: Int) -> CStack {
        if size == 0 && stack == [] {
            print("Error: Nhập giá trị không chính xác. \nHãy nhập Size lớn hơn 0 và lớn hơn hoặc bằng số phần tử ban đầu của Stack.\n")
        } else if isFull() == true {
            print("Stack đã đầy. Không thể thêm phần tử mới.\n")
        } else {
            stack.append(element)
        }
        return CStack(size: size, stack: stack)
    }

    func remove() -> CStack {
        if size == 0 && stack == [] {
            print("Error: Nhập giá trị không chính xác. \nHãy nhập Size lớn hơn 0 và lớn hơn hoặc bằng số phần tử ban đầu của Stack.\n")
        } else if isEmpty() == true {
            print("Stack đang rỗng. Không thể xoá phần tử.\n")
        } else {
            stack.removeLast()
        }
        return CStack(size: size, stack: stack)
    }

    func printStack() {
        print("Size của Stack: \(size) \nCác giá trị trong Stack : \(stack)\n")
    }

    func printSize() {
        print("Số phần tử trong Stack hiện tại của là \(stack.count)\n")
    }

    func printTop() {
        if stack == [] {
            print("Error: Stack đang rỗng, không có phần tử ở đỉnh")
        } else {
            let a: Int = stack.last!
            print("Phần tử ở đỉnh của Stack: \(a)\n")
        }
    }

}

let st = CStack(size: 5, stack: [1, 5, 6, 8])
st.printStack()

st.add(element: 3)
st.printStack()

st.add(element: 9)
st.printStack()

st.remove()
st.printStack()

st.printSize()
st.printTop()
