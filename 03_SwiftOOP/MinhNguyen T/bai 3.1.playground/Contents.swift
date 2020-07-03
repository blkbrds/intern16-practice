import Foundation

class PhanSo {
    var tuso: Int
    var mauso: Int
    
    init?(tuso: Int, mauso: Int) {
        self.tuso = tuso
        if mauso != 0 {
            self.mauso = mauso
        } else {
            return nil
        }
    }
    
    func inPhanSo() -> String {
        return "\(tuso) / \(mauso)"
    }
    
    func congPS( ps2: PhanSo) -> PhanSo? {
        let tu = tuso * ps2.mauso + mauso * ps2.tuso
        let mau = mauso * ps2.mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    
    func truPS( ps2: PhanSo) -> PhanSo? {
        
        let tu = tuso * ps2.mauso - mauso * ps2.tuso
        let mau = mauso * ps2.mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    
    func nhanPS(ps2: PhanSo) -> PhanSo? {
        
        let tu = tuso * ps2.tuso
        let mau = mauso * ps2.mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    
    func chiaPS(ps2: PhanSo) -> PhanSo? {
        let tu = tuso * ps2.mauso
        let mau = mauso * ps2.tuso
        return PhanSo(tuso: tu, mauso: mau)
    }
}

if let soA = PhanSo(tuso: 2, mauso: 3), let soB = PhanSo(tuso: 3, mauso: 4),let cong = soA.congPS(ps2: soB){
    print(cong.inPhanSo())
}

