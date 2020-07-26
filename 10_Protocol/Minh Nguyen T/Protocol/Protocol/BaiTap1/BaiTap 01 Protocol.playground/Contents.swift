import UIKit

protocol DongVat {}

protocol Thu: DongVat {
    var isDi: Bool { get }
    func ten() -> String
}

protocol Chim: DongVat {
    var isBay: Bool { get }
    func ten() -> String
}

protocol Ca: DongVat {
    var isBoi: Bool { get }
    func ten() -> String
}

class CaChuon: Ca , Chim {
    var isBay: Bool { return true }
    var isBoi: Bool { return true }
    
    func ten() -> String {
        return "Ca chuon"
    }
}

class Bo: Thu {
    var isDi: Bool { return true }
    
    func ten() -> String {
        return "Con bo"
    }
}

class Ga: Chim {
    var isBay: Bool { return false }
    
    func ten() -> String {
        return "Con Ga"
    }
    
}

class Vit: Chim, Ca, Thu {
    var isBoi: Bool { return true }
    var isDi: Bool { return true }
    var isBay: Bool { return true }
    
    func ten() -> String {
        return "COn vit"
    }
}

class CaMap: Ca {
    var isBoi: Bool { return true }
    
    func ten() -> String {
        return "Ca Map"
    }
}

class Heo: Thu {
    var isDi: Bool { return true }
    
    func ten() -> String {
        return "Con Heo"
    }
}

class HaiCau: Thu, Ca {
    var isBoi: Bool { return true }
    var isDi: Bool { return false }
    
    func ten() -> String {
        return "Hai Cau"
    }
}

class Doi: Thu, Chim {
    var isBay: Bool { return true }
    var isDi: Bool { return true }
    
    func ten() -> String {
        return "Con Doi"
    }
}

class CaSau: Thu, Ca {
    var isBoi: Bool { return true }
    
    var isDi: Bool {
        return true
    }
    
    func ten() -> String {
        return "Ca Sau"
    }
}

let arr: [DongVat] = [CaChuon(), Bo(), Ga(), Vit(), CaMap(), Heo(), HaiCau(), Doi(), CaSau()]

enum GroupAnimal {
    case bietBay
    case bietBoi
    case bietDi
    case bayBoi
    case diBay
    case boiDi
    case coCa3
    case co1Trong3
    
    func lietke() -> [DongVat] {
        var bietBays: [DongVat] = []
        var bietBois: [DongVat] = []
        var bietDis: [DongVat] = []
        var bayBois: [DongVat] = []
        var diBays: [DongVat] = []
        var boiDis: [DongVat] = []
        var coCa3s: [DongVat] = []
        var co1Trong3s: [DongVat] = []
        
        switch self {
        case .bietBay:
            for animal in arr {
                if animal is Chim {
                    bietBays.append(animal)
                }
            }
            return bietBays
        case .bietBoi:
            for animal in arr {
                if animal is Ca {
                    bietBois.append(animal)
                }
            }
            return bietBois
        case .bietDi:
           for animal in arr {
                if animal is Thu {
                    bietDis.append(animal)
                }
           }
            return bietDis
        case .bayBoi:
            for animal in arr {
                if animal is Chim {
                    bayBois.append(animal)
                }
            }
            return bayBois
        case .diBay:
            for animal in arr {
                if animal is Chim {
                    diBays.append(animal)
                }
            }
            return diBays
        case .boiDi:
            for animal in arr {
                if animal is Chim {
                    boiDis.append(animal)
                }
            }
            return boiDis
        case .coCa3:
            for animal in arr {
                if animal is Chim && animal is Ca && animal is Thu{
                    coCa3s.append(animal)
                }
            }
            return coCa3s
        case .co1Trong3:
            for animal in arr {
                if animal is Chim || animal is Ca || animal is Thu{
                    co1Trong3s.append(animal)
                }
            }
            return co1Trong3s
        }
    }
}

GroupAnimal.bietBay.lietke()
