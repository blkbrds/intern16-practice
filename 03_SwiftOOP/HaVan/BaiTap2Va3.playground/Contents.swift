import Foundation

class DaGiac {
    var soCanh: Int
    var doDaiCacCanh: [Int]
    init(socanh: Int, doDaiCacCanh: [Int]) {
        self.soCanh = socanh
        self.doDaiCacCanh = doDaiCacCanh
    }
    //Kiểm tra có phải là đa giác hay không
    func kiemTra() -> Bool {
        return soCanh == doDaiCacCanh.count
    }
    
    func tinhChuVi() -> Int {
        if kiemTra() == false {
            return -1
        }
        else {
            var chuvi = 0
            for i in 0...soCanh - 1 {
                chuvi += doDaiCacCanh[i]
            }
            return chuvi
        }
    }
    
    func inGiaTriCacCanh() -> String {
        var giaTriIn = ""
        for i in 0...soCanh - 1 {
            giaTriIn += "\(doDaiCacCanh[i]) "
        }
        return giaTriIn
    }
}

class TamGiac : DaGiac {
    // kiểm tra có phải là tam giác hay không
    override func kiemTra() -> Bool {
        return super.doDaiCacCanh[0] + super.doDaiCacCanh[1] > super.doDaiCacCanh[2] &&
        super.doDaiCacCanh[1] + super.doDaiCacCanh[2] > super.doDaiCacCanh[0] && super.doDaiCacCanh[0] + super.doDaiCacCanh[2] > super.doDaiCacCanh[1] && super.kiemTra() && super.soCanh == 3
    }
    
    override func tinhChuVi() -> Int {
        if kiemTra() == false {
            return -1
        } else {
            var chuVi = 0
            for canh in doDaiCacCanh {
                chuVi += canh
            }
            return chuVi
        }
    }
    
    func tinhDienTich() -> Double {
        if kiemTra() == false {
            return -1
        } else {
            let p = Double(tinhChuVi()) / 2
            print(p)
            return sqrt(p * (p - Double(doDaiCacCanh[0])) * (p - Double(doDaiCacCanh[1])) * (p - Double(doDaiCacCanh[2])))
        }
    }
}

//MARK: Kiểm tra kết quả
let daGiac = DaGiac(socanh: 4, doDaiCacCanh: [1,2,3,4,9,10])
if daGiac.kiemTra() {
    print("Chu vi đa giác : \(daGiac.tinhChuVi())")
    print("In giá trị các cạnh : \(daGiac.inGiaTriCacCanh())")
} else {
    print("Không phải là đa giác")
}
let tamGiac = TamGiac(socanh: 3, doDaiCacCanh: [2,2,3])
if tamGiac.kiemTra() {
    print("Chu vi : \(tamGiac.tinhChuVi())")
    print("Diện tích: \(tamGiac.tinhDienTich())")
} else {
    print("Không phải là tam giác")
}


