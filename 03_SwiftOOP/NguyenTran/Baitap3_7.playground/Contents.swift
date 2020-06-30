import UIKit
import Foundation

struct student {
    var fullname: String
    var birthday: Int
    var score: Float

    init(fullname: String, birthday: Int, score: Float) {
        if fullname == "" || birthday < 1900 || score < 0 {
            print("Error: Giá trị nhập vào không chinh xác. Khởi tạo giá trị mặc định")
            self.fullname = ""
            self.birthday = 1900
            self.score = 0
        } else {
        self.fullname = fullname
        self.birthday = birthday
        self.score = score
        }
    }
}

class studentList {
    var list: [student]
    
    init(list: [student]) {
        self.list = list
    }
    
    func sort() -> [student] {
        var temp:student
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
            list[i].fullname = list[i].fullname.capitalized
        }
        return list
    }

    
    func printList(list: [student]) {
        print("Danh sách học sinh sau khi đã sắp xếp là\n")
        for i in 0..<list.count {
            print("\(i+1). \(list[i].fullname) - \(list[i].birthday) - \(list[i].score)")
        }
    }
}

let std1 = student(fullname: "nguyễn văn a", birthday: 1992, score: 10)
let std2 = student(fullname: "phạm thị b", birthday: 1995, score: 9)
let std3 = student(fullname: "trần minh c", birthday: 1997, score: 7.5)
let std4 = student(fullname: "đỗ khánh d", birthday: 1998, score: 7.5)
let std5 = student(fullname: "ngô hoàng e", birthday: 1999, score: 5)

let list = studentList(list: [std1,std2,std3,std4,std5])

let result = list.sort()
print(list.printList(list: result))

