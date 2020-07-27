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
class caChuon: Chim, Ca {
    var isBay: Bool = true
    
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Ca chuon"
    }
}
class bo: Thu {
    func ten() -> String {
        return "Bo"
    }
    var isDi: Bool = true
}
class ga: Chim {
    var isBay: Bool = true
    func ten() -> String {
        return "Ga"
    }
}
class vit: Chim, Thu, Ca {
    var isDi: Bool = true
    var isBay: Bool = true
    var isBoi: Bool = true
    func ten() -> String {
        return "Vit"
    }
}
class caMap: Ca {
    var isBoi: Bool = true
    func ten() -> String {
        return "Ca Map"
    }
}
class heo: Thu {
    var isDi: Bool = true
    func ten() -> String {
        return "Heo"
    }
}
class haiCau: Thu, Ca {
    var isBoi: Bool = true
    var isDi: Bool = true
    func ten() -> String {
        return "Hai Cau"
    }
}
class doi: Chim, Thu {
    var isDi: Bool = true
    var isBay: Bool = true
    func ten() -> String {
        return "Doi"
    }
}
class caSau: Ca, Thu {
    var isBoi: Bool = true
    var isDi: Bool = true
    func ten() -> String {
        return "Ca Sau"
    }
}

