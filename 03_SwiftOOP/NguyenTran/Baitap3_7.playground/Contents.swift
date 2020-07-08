import Foundation

struct Student {
    var fullName: String
    var birthday: Int
    var score: Float

    init(fullName: String, birthday: Int, score: Float) {
        if fullName == "" || birthday < 1900 || score < 0 {
            print("Error: Giá trị nhập vào không chinh xác. Khởi tạo giá trị mặc định")
            self.fullName = ""
            self.birthday = 1900
            self.score = 0
        } else {
        self.fullName = fullName
        self.birthday = birthday
        self.score = score
        }
    }
}

class StudentList {
    var list: [Student]
    
    init(list: [Student]) {
        self.list = list
    }
    
    func sort() -> [Student] {
        var temp:Student
        for i in 0..<list.count - 1 {
            for j in i+1..<list.count {
                if list[i].score < list[j].score {
                    temp = list[i]
                    list[i] = list[j]
                    list[j] = temp
                } else if list[i].score == list[j].score {
                    if list[i].birthday < list[j].birthday {
                        temp = list[i]
                        list[i] = list[j]
                        list[j] = temp
                    }
                }
            }
        }
        for i in 0..<list.count {
            list[i].fullName = list[i].fullName.capitalized
        }
        return list
    }

    
    func printList(list: [Student]) {
        print("Danh sách học sinh sau khi đã sắp xếp là\n")
        for i in 0..<list.count {
            print("\(i+1). \(list[i].fullName) - \(list[i].birthday) - \(list[i].score)")
        }
    }
}

let std1 = Student(fullName: "nguyễn văn a", birthday: 1992, score: 10)
let std2 = Student(fullName: "phạm thị b", birthday: 1995, score: 9)
let std3 = Student(fullName: "trần minh c", birthday: 1997, score: 7.5)
let std4 = Student(fullName: "đỗ khánh d", birthday: 1998, score: 7.5)
let std5 = Student(fullName: "ngô hoàng e", birthday: 1999, score: 5)

let list = StudentList(list: [std1,std2,std3,std4,std5])

let result = list.sort()
print(list.printList(list: result))

