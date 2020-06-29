import UIKit


class PhanSo {
    var tuso: Int
    var mauso: Int
    init(tuso: Int, mauso: Int) {
        self.tuso = tuso
        self.mauso = mauso
    }
    
    func inPhanSo() -> String{
        return "\(tuso)/\(mauso)"
    }
    
    func congPS(ps2: PhanSo)-> PhanSo{
        let tu = tuso * ps2.mauso + mauso * ps2.tuso
        let mau = mauso * ps2.mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    func truPS(ps2: PhanSo)-> PhanSo{
        let tu = tuso * ps2.mauso - mauso * ps2.tuso
        let mau = mauso * ps2.mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    func nhanPS(ps2: PhanSo)-> PhanSo{
        let tu = tuso * ps2.tuso
        let mau = mauso * ps2.mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    func chiaPS(ps2: PhanSo)-> PhanSo{
        let tu = tuso * ps2.mauso
        let mau = mauso * ps2.tuso
        return PhanSo(tuso: tu, mauso: mau)
    }
}

var soA:PhanSo = PhanSo(tuso: 2, mauso: 3)
var soB:PhanSo = PhanSo(tuso: 3, mauso: 4)

var tong = soA.congPS(ps2: soB)
tong.inPhanSo()
