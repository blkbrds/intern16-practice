import Foundation

class CStack {
    var size: Int
    var Stack: Array<Int>

    init(size: Int, Stack: [Int]) {
        if size <= 0 {
            print("Error: Size của Stack phải lớn hơn hoặc bằng 0")
            self.size = 0
            self.Stack = []
        } else if size < Stack.count {
            print("Error: Stack đang nhập vào có nhiều phần tử hơn size được cấp.")
            self.size = 0
            self.Stack = []
        } else {
            self.size = size
            self.Stack = Stack
        }
    }

    func isFull() -> Bool {
        if size <= Stack.count {
            return true
        } else {
            return false
        }
    }

    func isEmpty() -> Bool {
        if Stack.count == 0 {
            return true
        } else {
            return false
        }
    }

    func add(element: Int) -> CStack {
        if size == 0 && Stack == [] {
            print("Error: Nhập giá trị không chính xác. \nHãy nhập Size lớn hơn 0 và lớn hơn hoặc bằng số phần tử ban đầu của Stack.\n")
        } else if isFull() == true {
            print("Stack đã đầy. Không thể thêm phần tử mới.\n")
        } else {
            Stack.append(element)
        }
        return CStack(size: size, Stack: Stack)
    }

    func remove() -> CStack {
        if size == 0 && Stack == [] {
            print("Error: Nhập giá trị không chính xác. \nHãy nhập Size lớn hơn 0 và lớn hơn hoặc bằng số phần tử ban đầu của Stack.\n")
        } else if isEmpty() == true {
            print("Stack đang rỗng. Không thể xoá phần tử.\n")
        } else {
            Stack.removeLast()
        }
        return CStack(size: size, Stack: Stack)
    }

    func printStack() {
        print("Size của Stack: \(size) \nCác giá trị trong Stack : \(Stack)\n")
    }

    func printSize() {
        print("Số phần tử trong Stack hiện tại của là \(Stack.count)\n")
    }

    func printTop() {
        if Stack == [] {
            print("Error: Stack đang rỗng, không có phần tử ở đỉnh")
        } else {
            let a: Int = Stack.last!
            print("Phần tử ở đỉnh của Stack: \(a)\n")
        }
    }

}

let st = CStack(size: 10, Stack: [1, 5, 6, 8])
st.printStack()

st.add(element: 3)
st.printStack()

st.add(element: 9)
st.printStack()

st.remove()
st.printStack()

st.printSize()
st.printTop()
