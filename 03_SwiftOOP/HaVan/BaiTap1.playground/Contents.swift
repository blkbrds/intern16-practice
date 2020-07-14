import Foundation

//MARK: class phân số
class PhanSo {
    var tuSo: Int
    var mauSo: Int
    init(tuSo tu: Int, mauSo mau: Int) {
        self.tuSo = tu
        self.mauSo = mau
    }

    func tinhUCLN(num1 a: Int, num2 b: Int) -> Int {
        if a == b {
            return a
        } else if a > b {
            return tinhUCLN(num1: a - b, num2: b)
        } else {
            return tinhUCLN(num1: a, num2: b - a)
        }
    }

    func dinhGiaTri(phanSo ps: PhanSo) -> PhanSo? {
        if ps.mauSo == 0 {
            return nil
        } else {
            return ps
        }
    }

    // rút gọn 1 phân số
    func rutGon(phanso ps: PhanSo) -> PhanSo? {
        if let _ = dinhGiaTri(phanSo: ps) {
            if ps.tuSo == 0 {
                return ps
            } else {
                let rutGon = abs(tinhUCLN(num1: abs(ps.tuSo), num2: abs(ps.mauSo)))
                let rutTu = ps.tuSo / rutGon
                let rutMau = ps.mauSo / rutGon
                let psMoi = PhanSo(tuSo: rutTu, mauSo: rutMau)
                return psMoi
            }
        }
        return nil
    }
    
    func congHaiPhanSo(ps2: PhanSo) -> PhanSo? {
        // nhận tử số + mẫu số mới
        let tuSoMoi = self.tuSo * ps2.mauSo + ps2.tuSo * self.mauSo
        let mauSoMoi = self.mauSo * ps2.mauSo
        // tạo phân số mới
        let ps = PhanSo(tuSo: tuSoMoi, mauSo: mauSoMoi)
        // print("phân số kết quả \(ps.tuSo) / \(ps.mauSo)")
        // rút gọn phân số mới
        return rutGon(phanso: ps)
    }

    func truHaiPhanSo(ps2: PhanSo) -> PhanSo? {
        // nhận tử số + mẫu số mới
        let tuSoMoi = self.tuSo * ps2.mauSo - ps2.tuSo * self.mauSo
        let mauSoMoi = self.mauSo * ps2.mauSo
        // tạo phân số mới
        let ps = PhanSo(tuSo: tuSoMoi, mauSo: mauSoMoi)
        // rút gọn phân số mới
        return rutGon(phanso: ps)
    }

    func nhanHaiPhanSo(ps2: PhanSo) -> PhanSo? {
        let tuSo = self.tuSo * ps2.tuSo
        let mauSo = self.mauSo * ps2.mauSo
        // tạo phân số mới từ kết quả tử và mẫu mới nhận được
        let ps = PhanSo(tuSo: tuSo, mauSo: mauSo)
        // rút gọn phân số
        return rutGon(phanso: ps)
    }

    func chiaHaiPhanSo(ps2: PhanSo) -> PhanSo? {
        // chia 2 phân số = ps1 nhân ps2 đảo ngược
        let daoPs2 = PhanSo(tuSo: ps2.mauSo, mauSo: ps2.tuSo)
        // thực hiện lấy ps mới, trả kq về (tử số, mẫu số)
        let ps = nhanHaiPhanSo(ps2: daoPs2)
        // rút gọn phân số
        if let ps = ps {
            return rutGon(phanso: ps)
        } else {
            return nil
        }
    }
}

//MARK: kiểm tra kết quả
// tạo 2 phân số
let phanSo1 = PhanSo(tuSo: -3, mauSo: 6)
let phanSo2 = PhanSo(tuSo: 1, mauSo: 2)
print("phân số 1 là : \(phanSo1.tuSo) / \(phanSo1.mauSo)")
print("phân số 2 là : \(phanSo2.tuSo) / \(phanSo2.mauSo)")
// lấy kết quả cộng 2 phân số
if let cong = phanSo1.congHaiPhanSo(ps2: phanSo2){
    if cong.tuSo == 0 {
        print("cộng hai phân số: 0")
    } else if abs(cong.tuSo) == 1 && abs(cong.mauSo) == 1 {
        print("cộng hai phân số: \(cong.tuSo)")
    } else {
        print("cộng hai phân số : \(cong.tuSo) / \(cong.mauSo)")
    }
} else {
    print("kết quả trả về không xác định, phân số nhập vào không được có mẫu bằng 0")
}

// lấy kết quả trừ 2 phân số
if let tru = phanSo1.truHaiPhanSo(ps2: phanSo2){
    if tru.tuSo == 0 {
        print("trừ hai phân số: 0")
    } else if abs(tru.tuSo) == 1 && abs(tru.mauSo) == 1 {
        print("trừ hai phân số: \(tru.tuSo)")
    } else {
        print("trừ hai phân số : \(tru.tuSo) / \(tru.mauSo)")
    }
} else {
    print("kết quả trả về không xác định, phân số nhập vào không được có mẫu bằng 0")
}

// lấy kết quả nhân 2 phân số
if let nhan = phanSo1.nhanHaiPhanSo(ps2: phanSo2){
    if nhan.tuSo == 0 {
        print("nhân hai phân số: 0")
    } else if abs(nhan.tuSo) == 1 && abs(nhan.mauSo) == 1 {
        print("nhân hai phân số: \(nhan.tuSo)")
    } else {
        print("nhân hai phân số : \(nhan.tuSo) / \(nhan.mauSo)")
    }
} else {
    print("kết quả trả về không xác định, phân số nhập vào không được có mẫu bằng 0")
}

// lấy kết quả chia 2 phân số
if let chia = phanSo1.chiaHaiPhanSo(ps2: phanSo2){
    if chia.tuSo == 0 {
        print("chia hai phân số: 0")
    } else if abs(chia.tuSo) == 1 && abs(chia.mauSo) == 1 {
        print("chia hai phân số: \(chia.tuSo)")
    } else {
        print("chia hai phân số : \(chia.tuSo) / \(chia.mauSo)")
    }
} else {
    print("kết quả trả về không xác định, phân số nhập vào không được có mẫu bằng 0")
}








