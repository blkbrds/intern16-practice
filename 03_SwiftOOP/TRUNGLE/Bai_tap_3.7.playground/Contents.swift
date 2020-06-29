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
      var hocSinhS: [HocSinh] = []
       
       init(hocSinhS: [HocSinh]) {
           self.hocSinhS = hocSinhS
       }

func SapXep () -> [HocSinh] {
    var arr : [HocSinh] = hocSinhS
    for i in 0...arr.count {
        for j in 0...arr.count - i - 1 {
            if arr[j].tongDiem < arr[j - 1].tongDiem {
                let temp = arr[j - 1 ]
                arr[j - 1 ] = arr[j]
                arr[j] = temp
            } else {
                if arr[j].tongDiem == arr[j - 1].tongDiem {
                    for i in 0...arr.count {
                        for j in 0...arr.count - i - 1 {
                            if arr[j].namSinh < arr[j - 1].namSinh {
                                let temp = arr[j - 1]
                                arr[i] = arr[j - 1]
                                arr[ j - 1 ] = temp
                            }
                        }
                    }
                }
            }
        }
    }
    return arr
}
    func getChar ( string: String, index : Int) -> String {
        if index < string.count {
            return String(string[string.index(string.startIndex, offsetBy: index)])
        }
        return " "
    }
    
      func inTen() -> [HocSinh] {
            let tempArr: [HocSinh] = hocSinhS
            for index in 0..<tempArr.count {
                for index2 in 0..<tempArr[index].hoTen.count {
                    let temp = tempArr[index].hoTen
                    if (getChar(string: temp, index: index2 - 1) == " ") {
                        getChar(string: temp, index: index2).uppercased()
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

var mangHS = QuanLyHocSinh(hocSinhS: arrHocSinh )
var temp = mangHS.SapXep()
temp.forEach { (HocSinh) in
    print(HocSinh.hoTen)
}


