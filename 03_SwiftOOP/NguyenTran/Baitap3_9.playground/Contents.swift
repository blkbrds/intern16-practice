import Foundation

class Mang1Chieu {
    var arr: Array<Int>

    init(arr: Array<Int>) {
        self.arr = arr
    }

    func printArr() {
        print(arr)
    }

    func minmax() -> (Int, Int) {
        if arr == [] {
            print("Error: Mảng rỗng.")
            return (0, 0)
        } else {
            var max = arr[0]
            var min = arr[0]
            for i in 0..<arr.count {
                if arr[i] > max {
                    max = arr[i]
                }
                if arr[i] < min {
                    min = arr[i]
                }
            }
            return (min, max)
        }
    }
}

let a = Mang1Chieu(arr: [1,4,6,2,29,45])

a.printArr()
print("Số lớn nhất trong mảng là \(a.minmax().1)\nSố nhỏ nhất trong mảng là \(a.minmax().0)")
