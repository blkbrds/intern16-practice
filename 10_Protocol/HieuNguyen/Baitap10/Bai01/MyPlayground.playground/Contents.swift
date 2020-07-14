protocol DongVat: class {
    func ten() -> String
}

protocol Thu: DongVat {
    var isDi: Bool { get set }
}

protocol Chim: DongVat {
    var isBay: Bool { get set }
}

protocol Ca: DongVat {
    var isBoi: Bool { get set }
}

class CaChuon: Ca, Chim {
    var isBoi: Bool = true
    var isBay: Bool = true
    
    func ten() -> String {
        return "Ca Chuon"
    }
}

class Bo: Thu {
    var isDi: Bool = true
    
    func ten() -> String {
        return "Bo"
    }
}

class Ga: Chim {
    var isBay: Bool = true
    
    func ten() -> String {
        return "Ga"
    }
}

class Vit: Chim, Thu, Ca {
    var isBay: Bool = true
    var isDi: Bool = true
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Vit"
    }
}

class CaMap: Ca {
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Ca Map"
    }
}

class Heo: Thu {
    var isDi: Bool = true
    
    func ten() -> String {
        return "Heo"
    }
}

class HaiCau: Thu, Ca {
    var isDi: Bool = true
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Hai Cau"
    }
}

class Doi: Thu, Chim {
    var isDi: Bool = true
    var isBay: Bool = true
    
    func ten() -> String {
        return "Doi"
    }
}

class CaSau: Thu, Ca {
    var isDi: Bool = true
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Ca Sau"
    }
}

let caChuon = CaChuon()
let bo = Bo()
let ga = Ga()
let vit = Vit()
let caMap = CaMap()
let heo = Heo()
let haiCau = HaiCau()
let doi = Doi()
let caSau = CaSau()

let dongVat: [DongVat] = [caChuon, bo, ga, vit, caMap, heo, haiCau, doi, caSau]

// bai tap 1
func printBai1() -> [DongVat]{
    var danhSach: [DongVat] = []
    
    for dv in dongVat {
        if let dv = dv as? Chim {
            if dv.isBay {
                danhSach.append(dv)
            }
        }
    }
    return danhSach
}
let result = printBai1()
for rs in result {
    print(rs.ten())
}
