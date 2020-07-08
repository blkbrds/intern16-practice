import Foundation

class TamGiacPytago {
    var canh: [[Int]] = [[]]

    enum enumCheckArray {
        case nhohonbang0
        case rong
        case saiSoCanh
        case valid([[Int]])
    }

    func checkArray(arr: [[Int]]) -> enumCheckArray {
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
            } else if count0 != 0 {
                return .nhohonbang0
            } else {
                return .valid(arr)
            }
        }
    }

    init (canh: [[Int]]) {
        let kiemtra = checkArray(arr: canh)
        switch kiemtra {
        case .nhohonbang0:
            print("Error: Trong mảng có giá trị nhỏ hơn hoặc bằng 0.")
        case .rong:
            print("Error: Nhập mảng rỗng.")
            self.canh = [[]]
        case .saiSoCanh:
            print("Error: Nhập mảng có số cạnh tam giác khác 3.")
            self.canh = [[]]
        case .valid(let arrCanh):
            self.canh = arrCanh
        }
    }

    func checkPytago() {
        if self.canh == [[]] {
            print("Không thể thực hiện chương trình, hãy nhập lại mảng thoả mãn các điều kiện sau:\n- Không phải mảng rỗng\n- Không có phần tử nhỏ hơn hoặc bằng 0\n- Mảng con có số phần từ khác 3")
        } else {
            for i in 0..<self.canh.count {
                self.canh[i].sort()
                if self.canh[i][0] * self.canh[i][0] + self.canh[i][1] * self.canh[i][1] == self.canh[i][2] * self.canh[i][2] {
                    print(self.canh[i])
                }
            }
        }
    }
}

let arrCanh = TamGiacPytago(canh: [[3, 4, 5], [0, 0, 0], [1, 3, 2]])

arrCanh.checkPytago()

