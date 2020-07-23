import UIKit

protocol DongVat {
    func ten() -> String
}

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

class Bo: Thu {
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "Con bò"
    }
}

class Heo: Thu {
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "Con heo"
    }
}

class HaiCau: Thu, Ca {
    var isBoi: Bool {
        return true
    }
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "Con hải cẩu"
    }
}

class Doi: Thu, Chim {
    var isBay: Bool {
        return true
    }
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "Con dơi"
    }
}

class CaSau: Thu, Ca {
    var isBoi: Bool {
        return true
    }
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "Con cá sấu"
    }
}

class Ga: Chim {
    var isBay: Bool {
        return true
    }
    func ten() -> String {
        return "Con gà"
    }
}

class Vit: Chim, Thu, Ca {
    var isBoi: Bool {
        return true
    }
    var isDi: Bool {
        return true
    }
    var isBay: Bool {
        return true
    }
    func ten() -> String {
        return "Con vịt"
    }
}

class CaMap: Ca {
    var isBoi: Bool {
        return true
    }
    func ten() -> String {
        return "Cá mập"
    }
}

class CaChuon: Chim, Ca {
    var isBay: Bool {
        return true
    }
    var isBoi: Bool {
        return true
    }
    func ten() -> String {
        return "Cá chuồn"
    }
}

let bo = Bo(), heo = Heo(), haicau = HaiCau(), doi = Doi(), casau = CaSau(), ga = Ga(), vit = Vit(), camap = CaMap(), cachuon = CaChuon()
let arr: [DongVat] = [bo, heo, haicau, doi, casau, ga, vit, camap, cachuon]

enum Listing {
    case bietDi
    case bietBoi
    case bietBay
    case bayVaBoi
    case diVaBay
    case diVaBoi
    case ca3
    case motTrong3

    func lietKe() -> [DongVat]{
        var bietDi: [DongVat] = []
        var bietBoi: [DongVat] = []
        var bietBay: [DongVat] = []
        var bayVaBoi: [DongVat] = []
        var diVaBay: [DongVat] = []
        var diVaBoi: [DongVat] = []
        var ca3: [DongVat] = []
        var motTrong3: [DongVat] = []
        
        switch self {
        case .bietDi:
            for dv in arr {
                if let dv = dv as? Thu {
                    if dv.isDi {
                        bietDi.append(dv)
                    }
                }
            }
            return bietDi
        case .bietBoi:
            for dv in arr {
                if let dv = dv as? Ca {
                    if dv.isBoi {
                        bietBoi.append(dv)
                    }
                }
            }
            return bietBoi
        case .bietBay:
            for dv in arr {
                if let dv = dv as? Chim {
                    if dv.isBay {
                        bietBay.append(dv)
                    }
                }
            }
            return bietBay
        case .bayVaBoi:
            for dv in arr {
                if let dv = dv as? Chim & Ca {
                    if dv.isBay && dv.isBoi {
                        bayVaBoi.append(dv)
                    }
                }
            }
            return bayVaBoi
        case .diVaBay:
            for dv in arr {
                if let dv = dv as? Chim & Thu {
                    if dv.isBay && dv.isDi {
                        diVaBay.append(dv)
                    }
                }
            }
            return diVaBay
        case .diVaBoi:
            for dv in arr {
                if let dv = dv as? Thu & Ca {
                    if dv.isDi && dv.isBoi {
                        diVaBoi.append(dv)
                    }
                }
            }
            return diVaBoi
        case .ca3:
            for dv in arr {
                if let dv = dv as? Chim & Ca & Thu {
                    if dv.isBay && dv.isBoi && dv.isDi {
                        ca3.append(dv)
                    }
                }
            }
            return ca3
        case .motTrong3:
            for dv in arr {
                if let dv = dv as? Chim & Ca & Thu {
                    if dv.isBay || dv.isBoi || dv.isDi {
                        motTrong3.append(dv)
                    }
                }
            }
            return motTrong3
        }
    }
}

Listing.bietDi.lietKe()
Listing.bietBay.lietKe()
Listing.bietBoi.lietKe()
Listing.bayVaBoi.lietKe()
Listing.diVaBay.lietKe()
Listing.diVaBoi.lietKe()
Listing.ca3.lietKe()
Listing.motTrong3.lietKe()
