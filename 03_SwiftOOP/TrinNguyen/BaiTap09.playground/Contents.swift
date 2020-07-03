import Foundation

class Array {
    var size: Int
    var arr = [Int]()

    init(size: Int, arr: [Int]) {
        self.size = size
        self.arr = arr
    }

    func inMang() -> Int {
        for size in 0..<arr.count {
            print("Cac phan tu la: \(arr[size])")
        }
        return size
    }

    func findMinMax() -> (min: Int,max: Int) {
        var currentMin = arr[0]
        var currentMax = arr[0]
        for value in arr[1..<arr.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
}

let test = Array(size: 4, arr: [1, 5, 2, 3])
test.inMang()
test.findMinMax()
print("Min la: \(test.findMinMax().min) Max la: \(test.findMinMax().max) ")
