
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

final class Bo: Thu {
    var isDi: Bool = true
    
    func ten() -> String {
        return "Bo"
    }
}

final class Heo: Thu {
    var isDi: Bool = true
    
    func ten() -> String {
        return "Heo"
    }
}

final class HaiCau: Thu, Ca {
    var isDi: Bool = true
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Hai Cau"
    }
}

final class Doi: Thu, Chim {
    var isDi: Bool = true
    var isBay: Bool = true
    
    func ten() -> String {
        return "Dơi"
    }
}

final class CaSau: Thu, Chim {
    var isDi: Bool = true
    var isBay: Bool = true
    
    func ten() -> String {
        return "Cá Sấu"
    }
}

final class Ga: Chim {
    var isBay: Bool = true
    
    func ten() -> String {
        return "Gà"
    }
}

final class Vit: Chim, Ca {
    var isBay: Bool = true
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Vit"
    }
}

final class CaChuon: Ca, Chim {
    var isBoi: Bool = true
    var isBay: Bool = true
    
    func ten() -> String {
        return "Ca chuon"
    }
}

final class CaMap: Ca {
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Ca Map"
    }
}

final class DanhSachDongVat {
    var danhSachDongVat : [DongVat] = []
    
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
    var tempArray : [DongVat] = []
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
var result = bietMotTrongBa()
for i in result {
    print(i.ten())
}
