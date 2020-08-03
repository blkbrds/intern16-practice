import UIKit

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

class CaChuon: Chim, Ca {
    var isBay: Bool = true
    
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Ca chuon"
    }
}

class Bo: Thu {
    func ten() -> String {
        return "Bo"
    }
    var isDi: Bool = true
}

class Ga: Chim {
    var isBay: Bool = true
    func ten() -> String {
        return "Ga"
    }
}

class Vit: Chim, Thu, Ca {
    var isDi: Bool = true
    var isBay: Bool = true
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
    var isBoi: Bool = true
    var isDi: Bool = true
    func ten() -> String {
        return "Hai Cau"
    }
}

class Doi: Chim, Thu {
    var isDi: Bool = true
    var isBay: Bool = true
    func ten() -> String {
        return "Doi"
    }
}

class CaSau: Ca, Thu {
    var isBoi: Bool = true
    var isDi: Bool = true
    func ten() -> String {
        return "Ca Sau"
    }
}
