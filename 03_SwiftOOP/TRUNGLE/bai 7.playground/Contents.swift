import Foundation

class Student {
    var name: String
    var yearOfBirth: Int
    var scores: Float
    
    init(name: String, yearOfBirth: Int, scores: Float) {
        self.name = name
        self.yearOfBirth = yearOfBirth
        self.scores = scores
    }
}

class ListStudents {
    var list: [Student]
    
    init(list: [Student]) {
        self.list = list
    }
    
    func sort() -> [Student] {
        list.sort { (st1: Student, st2: Student) -> Bool in
            if st1.scores > st2.scores {
                return true
            } else if st1.scores == st2.scores {
                return st1.yearOfBirth > st2.yearOfBirth
            } else {
                return false
            }
        }
        for st in list {
            st.name = st.name.capitalized
            print(st.name)
        }
        return list
    }
    
    func printList(ls : [Student]) -> String {
        var result = ""
        for st in list {
            result += "\(st.name) - \(st.yearOfBirth) - \(st.scores) ; "
        }
        return result
    }
}

extension StringProtocol {
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
//MARK: kiểm tra kết quả
var st = Student(name: "tran van a", yearOfBirth: 1997, scores: 7)
var st1 = Student(name: "nguyen van b", yearOfBirth: 1998, scores: 7)
var st2 = Student(name: "luu van c", yearOfBirth: 2000, scores: 9)
var st3 = Student(name: "vu van d", yearOfBirth: 1999, scores: 10)

var list = ListStudents(list: [st,st1,st2,st3])
print("danh sách học sinh sắp xếp theo điểm: \(list.printList(ls: list.sort()))")
