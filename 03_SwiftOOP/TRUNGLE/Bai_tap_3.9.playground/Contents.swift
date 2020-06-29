import UIKit

var str = "Hello, playground"
class MangMotChieu {
     var mang1Chieu: [Int]
    
    init(mang1Chieu: [Int]) {
        self.mang1Chieu = mang1Chieu
    }
    
     func printMang1Chieu() -> Void {
        for value in mang1Chieu {
            print(value)
        }
    }
    
     var max = 0
     var min = 9
    
     func printMinMax() -> (Int, Int) {
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

var m = MangMotChieu(mang1Chieu: [5, 2, 3, 4, 9])
var a = m.printMang1Chieu()
print("Mang 1 chieu: \(a) " )
print("Min max: \(m.printMinMax())")
