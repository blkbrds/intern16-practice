import Foundation

class TamGiacPytago {
    var canh: [Int] = []

    enum KiemTraArray {
        case nhohonbang0
        case rong
        case saiSoCanh
        case valid([Int])
    }

    func checkArray(arr: [Int]) -> KiemTraArray {
        if arr == [] {
            return .rong
        } else if arr.count != 3 {
            return .saiSoCanh
        } else {
            var count0 = 0
            for i in 0..<arr.count {
                if arr[i] <= 0 {
                    count0 += 1
                }
            }
            if count0 != 0 {
                return .nhohonbang0
            } else {
                return .valid(arr)
            }
        }
    }

    init? (canh: [Int]) {
        let kiemtra = checkArray(arr: canh)
        switch kiemtra {
        case .nhohonbang0:
            return nil
        case .rong:
            return nil
        case .saiSoCanh:
            return nil
        case .valid(let arrCanh):
            self.canh = arrCanh
        }
    }

    func checkPytago() -> Bool {
        self.canh.sort()
        if self.canh[0] * self.canh[0] + self.canh[1] * self.canh[1] == self.canh[2] * self.canh[2] {
            return true
        } else {
            return false
        }
    }
}

if let t1 = TamGiacPytago(canh: [3, 4, 5]), let t2 = TamGiacPytago(canh: [1, 4, 5]), let t3 = TamGiacPytago(canh: [3, 9, 5]) {
    let arrayTamGiac = [t1, t2, t3]
    for i in 0..<arrayTamGiac.count {
        if arrayTamGiac[i].checkPytago() == true {
            print(arrayTamGiac[i].canh)
        } else {
            continue
        }
    }
} else {
    print("Không thể thực hiện chương trình, hãy nhập lại mảng thoả mãn các điều kiện sau:\n- Không phải mảng rỗng\n- Không có phần tử nhỏ hơn hoặc bằng 0\n- Mảng con có số phần từ khác 3")
}

