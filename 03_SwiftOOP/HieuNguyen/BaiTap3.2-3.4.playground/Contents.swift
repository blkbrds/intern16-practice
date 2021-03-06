import Foundation

print("Bai tap 2")

class DaGiac {
    var soCanh: Int
    var kichThuocs: [Float]

    init?(soCanh: Int, kichThuocs: [Float]) {
        if soCanh == kichThuocs.count {
            self.soCanh = soCanh
            self.kichThuocs = kichThuocs
        } else {
            return nil
        }
    }

    func chuVi() -> Float {
        var chuVi: Float = 0
        for canh in kichThuocs {
            chuVi += canh
        }
        return chuVi
    }

    func inGiaTri() {
        var giaTri: String = "Canh gom: "
        for canh in kichThuocs {
            giaTri += "\(canh), "
        }
        print(giaTri)
    }
}

print("Truong hop 1: ")
if let daGiac = DaGiac(soCanh: 5, kichThuocs: [3.5,5,4.5,6,10]) {
    print("Chu vi: \(daGiac.chuVi())")
    print("Gia tri: \(daGiac.soCanh) canh: \(daGiac.inGiaTri())")
} else {
    print("Khong the khoi tao doi tuong")
}

print("Truong hop 2: ")
if let daGiac = DaGiac(soCanh: 3, kichThuocs: [3.5,5,4.5,6,10]) {
    print("Chu vi: \(daGiac.chuVi())")
    print("Gia tri \(daGiac.soCanh) canh: \(daGiac.inGiaTri())")
} else {
    print("Khong the khoi tao doi tuong")
}
print("---------")
print("Bai tap 3")

class TamGiac: DaGiac {
    override init?(soCanh: Int, kichThuocs: [Float]) {
        super.init(soCanh: soCanh, kichThuocs: kichThuocs)
    }
    
    override func chuVi() -> Float {
        return kichThuocs.reduce(0, { $0 + $1 })
    }
    
    // cong thuc heron
    func dienTich() -> Float {
        let nuaChuvi = self.chuVi() / 2
        return sqrt(nuaChuvi * (nuaChuvi - kichThuocs[0]) * (nuaChuvi - kichThuocs[1]) * (nuaChuvi - kichThuocs[2]) )
    }
}

if let tamGiac = TamGiac(soCanh: 3, kichThuocs: [3,4,5]) {
    print("Chu vi tam giac : \(tamGiac.chuVi())")
    print("Dien tich tam giac : \(tamGiac.dienTich())")
} else {
    print("Khong the khoi tao doi tuong")
}

print("---------")
print("Bai tap 4")

func isPitago (tg: TamGiac) -> Bool {
    let a = tg.kichThuocs[0]
    let b = tg.kichThuocs[1]
    let c = tg.kichThuocs[2]
    
    if c * c == a * a + b * b ||
       b * b == c * c + a * a ||
       a * a == b * b + c * c {
        return true
    } else {
        return false
    }
}

var mangTamGiac: [TamGiac] = []

func nhapTamGiac(mangtg: [TamGiac]) -> [TamGiac] {
    for tg in mangtg {
        if isPitago(tg: tg){
            mangTamGiac.append(tg)
        }
    }
    return mangTamGiac
}

if let tamGiac = TamGiac(soCanh: 3, kichThuocs: [3,4,5,6]) {
    nhapTamGiac(mangtg: [tamGiac])
} else {
    print("Khong the khoi tao doi tuong")
}

if let tamGiac = TamGiac(soCanh: 3, kichThuocs: [1,2,1]) {
    nhapTamGiac(mangtg: [tamGiac])
} else {
    print("Khong the khoi tao doi tuong")
}

if let tamGiac = TamGiac(soCanh: 3, kichThuocs: [6,8,10]) {
    nhapTamGiac(mangtg: [tamGiac])
} else {
    print("Khong the khoi tao doi tuong")
}

print("Tam giac thoa mang Pitago: ")
for temp in mangTamGiac {
    print(" \(temp.kichThuocs)")
}
