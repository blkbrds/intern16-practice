import UIKit

protocol DongVat {
    func ten() -> String
}
protocol Thu: DongVat {
    var isDi: Bool {get set}
}

protocol Chim: DongVat {
    var isBay: Bool {get set}
}

protocol Ca: DongVat {
    var isBoi: Bool {get set}
}

class Bo: Thu {
    func ten() -> String {
        return "Bo"
    }
    var isDi: Bool = true
}

class Heo: Thu {
    func ten() -> String {
        return "Heo"
    }
    var isDi: Bool = true
}

class HaiCau: Thu, Ca {
    func ten() -> String {
        return "Hai Cau"
    }
    var isDi: Bool = true
    var isBoi: Bool = true
    
}

class Doi: Thu, Chim {
    func ten() -> String {
        return "Dơi"
    }
    var isDi: Bool = true
    var isBay: Bool = true
}

class CaSau: Thu, Chim {
    func ten() -> String {
        return "Cá Sấu"
    }
    var isDi: Bool = true
    var isBay: Bool = true
}

class Ga: Chim {
    func ten() -> String {
        return "Gà"
    }
    
    var isBay: Bool = true
}

class Vit: Chim, Ca {
    func ten() -> String {
        return "Vit"
    }
    
    var isBay: Bool = true
    var isBoi: Bool = true
}

class CaChuon: Ca, Chim {
    func ten() -> String {
        return "Ca chuon"
    }
    
    var isBoi: Bool = true
    var isBay: Bool = true
    
}

class CaMap: Ca {
    func ten() -> String {
        return "Ca Map"
    }
    var isBoi: Bool = true
}

class DanhSachDongVat {
    var danhSachDongVat : [DongVat] = [DongVat]()
    func capNhatDanhSach() {
        let caChuon = CaChuon()
        let bo = Bo()
        let ga = Ga()
        let vit = Vit()
        let caMap = CaMap()
        let heo = Heo()
        let haiCau = HaiCau()
        let doi = Doi()
        let caSau = CaSau()
        danhSachDongVat = [caChuon, bo, ga, vit, caMap, heo, haiCau, doi, caSau]
    }
}

let danhSach = DanhSachDongVat()
danhSach.capNhatDanhSach()
let array = danhSach.danhSachDongVat
var bay: [DongVat] = []
var boi: [DongVat] = []
var di: [DongVat] = []
var bayVaBoi: [DongVat] = []
var diVaBay: [DongVat] = []
var boiVaDi: [DongVat] = []
var caBa: [DongVat] = []
var motTrongBa: [DongVat] = []


// Viết function
func bietBay()  {
    for i in 0...array.count - 1 where array[i] is Chim {
            bay.append(array[i])
    }
}

func bietBoi() {
    for i in 0...array.count - 1 where array[i] is Ca {
        boi.append(array[i])
        }
}

func bietDi() {
    for i in 0...array.count - 1 where array[i] is Thu {
        di.append(array[i])
    }
}

func bietBayVaBoi() {
    for i in 0...array.count - 1 {
        if array[i] is Chim && array[i] is Ca {
            bayVaBoi.append(array[i])
        }
    }
}

func bietDiVaBay() {
    for i in 0...array.count - 1 {
        if array[i] is Thu && array[i] is Chim {
            diVaBay.append(array[i])
        }
    }
}

func bietBoiVaDi() {
    for i in 0...array.count - 1 {
        if array[i] is Ca && array[i] is Thu {
            boiVaDi.append(array[i])
        }
    }
}

func bietCaBa() {
    for i in 0...array.count - 1 {
        if array[i] is Ca && array[i] is Thu && array[i] is Chim{
            caBa.append(array[i])
        }
    }
}

func bietMotTrongBa() -> [DongVat] {
    var tempArray = [DongVat]()
    for i in 0...array.count - 1 {
        if (array[i] is Ca && !(array[i] is Chim) && !(array[i] is Thu)) || (array[i] is Chim && !(array[i] is Ca) && !(array[i] is Thu))
            || array[i] is Thu && !(array[i] is Ca) && !(array[i] is Chim) {
            tempArray.append(array[i])
        }
    }
    return tempArray
    
}
bietBoiVaDi()
bietDiVaBay()
bietBayVaBoi()
bietCaBa()
bietMotTrongBa()
print(bietMotTrongBa())


