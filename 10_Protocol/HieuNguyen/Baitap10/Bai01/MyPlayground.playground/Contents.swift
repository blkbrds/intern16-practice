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

let dongVat = [caChuon, bo, ga, vit, caMap, heo, haiCau, doi, caSau] as [Any]

for i in 0..<dongVat.count {
    print(dongVat[i])
}
