import UIKit
class HocSinh {
    var hoTen : String
    var namSinh : Int
    var tongDiem : Int
    init( hoTen: String, namSinh: Int, tongDiem: Int) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
    
}
class QuanLyHocSinh {
    var students: [HocSinh] = []
   
    init(students: [HocSinh]) {
       self.students = students
    }

    func SapXep () -> [HocSinh] {
        var arr : [HocSinh] = students
        for i in 0...arr.count {
            for j in 0...arr.count - i + 1  {
                print("bbbi:\(i) -- \(j)")
                if arr[j].tongDiem < arr[j + 1].tongDiem {
                    let temp = arr[j - 1]
                    arr[j - 1] = arr[j]
                    arr[j] = temp
                } else {
                    print("aaaai:\(i) -- \(j)")
                    if arr[j].tongDiem == arr[j - 1].tongDiem {
                        for i in 0...arr.count {
                            for j in 0...arr.count - i {
                                if arr[j].namSinh < arr[j - 1].namSinh {
                                    let temp = arr[j - 1]
                                    arr[ j - 1 ] = arr[j]
                                    arr[j] = temp
                                }
                            }
                        }
                    }
                }
            }
        }
        return arr
    }
    func SX () -> [HocSinh] {
        students.sort { (HocSinh1, HocSinh2) -> Bool in
            if HocSinh1.tongDiem > hs2.tongDiem {
                return true
            } else if hs1.tongDiem == hs2.tongDiem {
                return hs1.namSinh > hs2.namSinh
            } else {
                return false
            }
        }
        for hs in students {
            hs.hoTen = hs.hoTen.capitalized
            print(hs.hoTen)
        }
        return students
    }
    func inDanhSach ( ds : [HocSinh]) -> String{
        var ketqua = ""
        for hs in students {
            ketqua += "\(hs.hoTen) - \(hs.namSinh) - \(hs.tongDiem)"
        }
        return ketqua
    }
    extension StringProtocol {
        var firstCapitalized : String {
            return prefix(1).capitalized + dropFirst()
        }
    }
    
    func getChar ( string: String, index : Int) -> String {
        if index < string.count {
            return String(string[string.index(string.startIndex, offsetBy: index)])
        }
        return " "
    }
    
      func inTen() -> [HocSinh] {
            let tempArr: [HocSinh] = students
            for i in 0..<tempArr.count {
                for j in 0..<tempArr[i].hoTen.count {
                    let temp = tempArr[i].hoTen
                    if (getChar(string: temp, index: j - 1) == " ") {
                        getChar(string: temp, index: j).uppercased()
                    }
                }
            }
            return tempArr
        }

    }

var hs1 = HocSinh(hoTen: "nguyen van a", namSinh: 1997, tongDiem: 10)
var hs2 = HocSinh(hoTen: "nguyen van b", namSinh: 1998, tongDiem: 10)
var hs3 = HocSinh(hoTen: "nguyen van c", namSinh: 1999, tongDiem: 10)


var arrHocSinh = [hs1, hs2, hs3]

var mangHS = QuanLyHocSinh(students: arrHocSinh )
var temp = mangHS.SapXep()
temp.forEach { (HocSinh) in
    print(HocSinh.hoTen)
}


