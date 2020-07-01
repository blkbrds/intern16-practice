import Foundation

class MangMotChieu {
    var mang: [Int]
    
    init(mang: [Int]) {
        self.mang = mang
    }
    
    func inMang() -> String {
        var doDai = ""
        for so in mang {
            doDai += "\(so) "
        }
        return doDai
    }
    
    func inMinMax() -> (Int, Int) {
        var min = mang[0]
        var max = mang[0]
        for so in mang {
            if so > max {
                max = so
            }
            if so < min {
                min = so
            }
        }
        return (min, max)
    }
}

//MARK: kiểm tra kết quả
var mang = MangMotChieu(mang: [1,2,7,9,10,0])
print("In mảng: \(mang.inMang())")
print("Số lớn nhất: \(mang.inMinMax().1)")
print("Số bé nhất: \(mang.inMinMax().0)")

