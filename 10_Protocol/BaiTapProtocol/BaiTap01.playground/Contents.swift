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

class CaChuon: Chim, Ca {
    var isBay: Bool {
        return true
    }

    var isBoi: Bool {
        return true
    }

    func ten() -> String {
        return "Ca chuon"
    }
}

class Bo: Thu {

    var isDi: Bool {
        return true
    }

    func ten() -> String {
        return "Bo"
    }
}

class Ga: Chim {
    var isBay: Bool {
        return true
    }

    func ten() -> String {
        return "Chim"
    }
}

class Vit: Chim, Thu, Ca {
    var isBay: Bool {
        return true
    }
    var isDi: Bool {
        return true
    }
    var isBoi: Bool {
        return true
    }
    func ten() -> String {
        return "Vit"
    }
}

class CaMap: Ca {
    var isBoi: Bool {
        return true
    }
    func ten() -> String {
        return "CaMap"
    }
}

class Heo: Thu {
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "Heo"
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
        return "HaiCau"
    }
}

class Doi: Thu, Chim {
    var isDi: Bool {
        return true
    }
    var isBay: Bool {
        return true
    }
    func ten() -> String {
        return "Doi"
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
        return "CaSau"
    }
}

var caChuon = CaChuon()
var bo = Bo()
var ga = Ga()
var vit = Vit()
var caMap = CaMap()
var heo = Heo()
var haiCau = HaiCau()
var doi = Doi()
var casau = CaSau()

var animals: [DongVat] = [bo, caChuon, ga, vit, caMap, heo, haiCau, doi, casau]

func bietBay() {
    for i in animals {
        if i is Chim {
            print(i.ten())
        }
    }
}

func bietBoi() {
    for i in animals {
        if i is Ca {
            print(i.ten())
        }
    }
}

func bietDi() {
    for i in animals {
        if i is Thu {
            print(i.ten())
        }
    }
}

func bietBoivaBay() {
    for i in animals {
        if i is Ca && i is Chim {
            print(i.ten())
        }
    }
}

func bietDivaBay() {
    for i in animals {
        if i is Thu && i is Chim {
            print(i.ten())
        }
    }
}

func bietBoivaDi() {
    for i in animals {
        if i is Ca && i is Thu {
            print(i.ten())
        }
    }
}

func bietBoiBayvaDi() {
    for i in animals {
        if i is Ca && i is Chim && i is Thu {
            print(i.ten())
        }
    }
}

func bietMotTrongBa() {
    for i in animals {
        if i is Ca || i is Chim || i is Thu {
            print(i.ten())
        }
    }
}

bietMotTrongBa()


