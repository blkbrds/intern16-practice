import Foundation

enum ThucHien {
    case success([Int])
    case fail
}

class CStack {
    var soPhanTuToiDa: Int
    var dsPhanTu: [Int]
    
    init(soPT sopt: Int, dsPT danhsach: [Int]) {
        self.soPhanTuToiDa = sopt
        self.dsPhanTu = danhsach
    }

    func isEmpty() -> Bool {
        if dsPhanTu.count == 0 {
            return true
        } else {
            return false
        }
    }
    
    func isFull() -> Bool {
        if dsPhanTu.count == soPhanTuToiDa {
            return true
        } else {
            return false
        }
    }
    
    func addElement(with newElement: Int) -> ThucHien {
        var newStack: [Int] = [newElement]
        if isFull() {
            return .fail
        } else {
            for pt in dsPhanTu {
                newStack.append(pt)
            }
            dsPhanTu = newStack
            return .success(dsPhanTu)
        }
    }
    
    func deleteElement() -> ThucHien {
        if isEmpty() {
            return .fail
        } else {
            dsPhanTu.remove(at: 0)
            return .success(dsPhanTu)
        }
    }
}

//MARK: kiểm tra kết quả
var newStack = CStack(soPT: 5, dsPT: [2,5,6,7,8])
var them = newStack.addElement(with: 4)
switch them {
    case .fail:
        print("ngăn xếp đầy, không thể thêm")
    case .success(let ds):
        print("đã thêm 4 vào ngăn xếp : \(ds)")
}

var xoa = newStack.deleteElement()
switch xoa {
    case .fail:
       print("ngăn xếp rỗng, không thể thực hiện xoá")
    case .success(let ds):
       print("đã xoá 1 phần tử của ngăn xếp : \(ds)")
}

