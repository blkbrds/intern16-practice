import UIKit


class Mang1Chieu {
     var mang1Chieu: [Int]
    
    init(mang1Chieu: [Int]) {
        self.mang1Chieu = mang1Chieu
    }
    
     func inMang1Chieu() -> String {
            var doDai = ""
            for so in mang1Chieu {
                doDai += "\(so) "
            }
            return doDai
        }
    
     var max = 0
     var min = 9
    
     func inMinMax() -> (Int, Int) {
        for value in mang1Chieu {
            if max < value {
                max = value
            }
        }
        for value in mang1Chieu {
            if min > value {
                min = value
            }
        }
        return (min, max)
    }
}

var mang = Mang1Chieu(mang1Chieu: [5, 2, 3, 4, 9,10, 10, 10, 10, 101, 100])
print("In mảng: \(mang.inMang1Chieu())")
print("Min max: \(mang.inMinMax())")
