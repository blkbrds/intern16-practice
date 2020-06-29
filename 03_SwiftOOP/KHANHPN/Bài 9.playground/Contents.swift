import UIKit

class Mang1c {
    var mang1: [Int] = []

    init(mang1: [Int]) {
        self.mang1 = mang1
    }

    func inMang () -> [Int] {
        var inMang1: [Int] = []
        for i in 0..<mang1.count {
            inMang1.append(mang1[i])
        }
        return inMang1
    }

    func min () -> Int {
        var min: Int = mang1[0]
        for i in 0..<mang1.count {
            if min > mang1[i] {
                min = mang1[i]
            }
        }
        return min
    }

    func max () -> Int {
        var max: Int = mang1[0]
        for i in 0..<mang1.count {
            if max < mang1[i] {
                max = mang1[i]
            }
        }
        return max
    }
}

var mang2 = Mang1c(mang1: [1, 3, 5, 0, 9, 69])

print("\(mang2.inMang())")
print("Min = \(mang2.min())")
print("Max = \(mang2.max())")
