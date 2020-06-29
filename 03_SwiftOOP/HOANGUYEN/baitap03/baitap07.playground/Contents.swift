import UIKit

struct Student {
    var name: String
    var year: Int
    var score: Float
    
    init(name: String, year: Int, score:Float) {
        self.name = name
        self.year = year
        self.score = score
    }
    
}

class listStudent {

    var arrStudent : Array<Student>
    
    init(arrStudent: Array<Student>) {
        self.arrStudent = arrStudent
    }
    
    func sortList() -> Array<Student> {
        var max = arrStudent[0].score
        var index: Int = 0
        var myear = 0
        for i in 0..<arrStudent.count-1 {
            for j in i+1..<arrStudent.count {
                if  max < arrStudent[j].score {
                    max = arrStudent[j].score
                    myear = arrStudent[j].year
                    
                    index = j
                }
                else if arrStudent[j].score == max {
                    if arrStudent[j].year > myear {
                        myear = arrStudent[j].year
                        index = j
                    }
                }
   
            }
            if arrStudent[i].score < max {
                let temp = arrStudent[i]
                arrStudent[i] = arrStudent[index]
                arrStudent[index] = temp
            }
            max = 0
        }
        for i in 0..<arrStudent.count {
            arrStudent[i].name = arrStudent[i].name.capitalized
        }
        return arrStudent
    }
    
}

let studen1 = Student(name: "Hoá", year: 1998, score: 8)
let studen2 = Student(name: "minh", year: 1997, score: 7)
let studen3 = Student(name: "Hà", year: 1997, score: 10)
let studen4 = Student(name: "Chung", year: 1992, score: 8)
let studen5 = Student(name: "Huyền", year: 1991, score: 8)
let studen6 = Student(name: "Khánh", year: 1998, score: 10)

let list = listStudent(arrStudent: [studen1, studen2, studen3, studen4, studen5, studen6])

list.sortList()
