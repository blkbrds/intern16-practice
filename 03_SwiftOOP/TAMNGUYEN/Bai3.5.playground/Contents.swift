import Foundation

class CStack {
    var capa: Int = 0
    var array: [Int] = []
    init(capa: Int, array: [Int]) {
        self.capa = capa
        self.array = array
    }
    
    func checkEmpty() -> Bool {
        if array.count == 0 {
            return true
        } else {
            return false
        }
    }
    
    func checkFull() -> Bool {
        if array.count == capa {
            return true
        } else {
            return false
        }
    }
    
    func add(them: Int) -> [Int] {
        if checkFull() == true {
            print("Full")
        }
        if checkFull() == false {
            array.append(them)
        }
        return array
    }
}

let kq = CStack(capa: 4,array: [1,2,3])

kq.checkFull()
kq.add(them: 2)

 
