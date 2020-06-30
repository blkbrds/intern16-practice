import UIKit
import Foundation

class tamGiacPytago {
    var Canh: [[Int]] = [[]]

    enum check {
        case nhohonbang0
        case rong
        case saiSoCanh
        case valid([[Int]])
    }

    func checkarr(arr: [[Int]]) -> check {
        if arr == [[]] {
            return .rong
        } else {
            var countkt = 0
            var count0 = 0
            for i in 0..<arr.count {
                if arr[i].count != 3 {
                    countkt += 1
                }
                for j in 0..<arr[i].count {
                    if arr[i][j] <= 0 {
                        count0 += 1
                    }
                }
            }
            if countkt != 0 {
                return .saiSoCanh
            } else if  count0 != 0 {
                return .nhohonbang0
            } else {
                return .valid(arr)
            }
        }
    }

    init (Canh: [[Int]]) {
        let kiemtra = checkarr(arr: Canh)
        switch kiemtra {
        case .nhohonbang0:
            print("Error: Trong mảng có giá trị nhỏ hơn hoặc bằng 0.")
        case .rong:
            print("Error: Nhập mảng rỗng.")
            self.Canh = [[]]
        case .saiSoCanh:
            print("Error: Nhập mảng có số cạnh tam giác khác 3.")
            self.Canh = [[]]
        case .valid(let arrCanh):
            self.Canh = arrCanh
        }
    }

//    func check_tamgiac(a: Int, b: Int, c: Int) -> Bool {
//        if (a >= b + c || b >= a + c || c >= a + b) {
//            return false
//        } else {
//            return true
//        }
//    }

    func check_pytago() {
        if self.Canh == [[]] {
            print("Không thể thực hiện chương trình, hãy nhập lại mảng thoả mãn các điều kiện sau:\n- Không phải mảng rỗng\n- Không có phần tử nhỏ hơn hoặc bằng 0\n- Mảng con có số phần từ khác 3")
        } else {
            for i in 0..<self.Canh.count {
                self.Canh[i].sort()
                if self.Canh[i][0] * self.Canh[i][0] + self.Canh[i][1] * self.Canh[i][1] == self.Canh[i][2] * self.Canh[i][2] {
                    print(self.Canh[i])
                }
            }
        }
    }
}

let arrCanh = tamGiacPytago(Canh: [[3, 4, 5], [0,0,0], [1,3,2]])

arrCanh.check_pytago()

