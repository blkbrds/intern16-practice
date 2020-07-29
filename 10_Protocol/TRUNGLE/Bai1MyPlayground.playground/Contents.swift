import UIKit

protocol DongVat {
    func ten() -> String
}
protocol Thu: DongVat {
    var isDi: Bool { get }
}
protocol Chim: DongVat {
    var isBay: Bool {get}
}
protocol Ca: DongVat {
    var isBoi: Bool { get }
}

class CaChuon: Ca, Chim {
    var isBoi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    func ten() -> String {
        return "Ca Chuon Dai Duong"
    }
}

class Bo: Thu {
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "Bo Sua"
    }
}

class Ga: Chim {
    var isBay: Bool {
        return true
    }
    
    func ten() -> String {
        return "Ga Rung"
    }
}
class Vit: Chim {
    var isBay: Bool {
        return true
    }
    func ten() -> String {
        return "Vit Troi"
    }
}
class CaMap: Ca {
    var isBoi: Bool {
        return true
    }
    func ten() -> String {
        return "Ca Map Trang"
    }
}
class Heo: Thu {
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "Heo rung"
    }
}
class HaiCau: Thu, Ca {
    var isDi: Bool {
        return true
    }
    var isBoi: Bool {
        return true
    }
    func ten() -> String {
        return "Hai Cau"
    }
}
class Doi: Thu, Chim {
    var isDi: Bool {
        return true
    }
    var isBay: Bool{
        return true
    }
    func ten() -> String {
        return "Doi khong lo"
    }
}
class CaSau: Thu, Ca {
    var isDi: Bool {
         return true
    }
    var isBoi: Bool {
        return true
    }
    func ten() -> String {
        return "Ca sau hoa ca"
    }
}
var Animals: [DongVat] = [CaChuon(), CaMap(), CaSau(), HaiCau(), Ga(), Vit(), Bo(), Doi(), Heo()]
print(Animals.map { "Con " + $0.ten() })

