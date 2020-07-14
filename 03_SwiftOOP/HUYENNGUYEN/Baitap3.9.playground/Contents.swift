import UIKit

class Mang1c {
    var array: [Int] = []

    init(mangMotChieu: [Int]) {
        self.array = mangMotChieu
    }

    func printArray() {
        for i in 0..<self.array.count {
            print(self.array[i])
        }
    }

    func printMax() -> String {
        var max = self.array[0]
        for i in 1..<self.array.count {
            if(array[i] > max) {
                max = array[i]
            }
        }
        return "Phan tu lon nhat: \(max)"
    }

    func printMin() -> String {
        var min = self.array[0]
        for i in 1..<self.array.count {
            if(array[i] < min) {
                min = array[i]
            }
        }
        return "Phan tu be nhat: \(min)"
    }

}

let mangA: [Int] = [1, -5, 88, -100, 0]
let mang: Mang1c = Mang1c(mangMotChieu: mangA)
mang.printArray()
print(mang.printMax())
print(mang.printMin())
