import Foundation

protocol HinhVe {
    func dienTich() -> Float
}

protocol HaiChieu: HinhVe {
    func chuVi() -> Float
}

class HinhTron: HaiChieu {
    var banKinh: Float

    init(banKinh: Float) {
        if banKinh < 0 {
            print("Error: Không được nhập bán kính âm. Khởi tạo giá trị mặc định bán kính = 0.")
            self.banKinh = 0
        } else {
            self.banKinh = banKinh
        }
    }

    func chuVi() -> Float {
        return 2 * banKinh * Float.pi
    }

    func dienTich() -> Float {
        return Float.pi * powf(banKinh, 2)
    }
}

class HinhVuong: HaiChieu {
    var canh: Float

    init(canh: Float) {
        if canh < 0 {
            print("Error: Không được nhập cạnh âm. Khởi tạo giá trị mặc định cạnh = 0.")
            self.canh = 0
        } else {
            self.canh = canh
        }
    }

    func chuVi() -> Float {
        return canh * 4
    }

    func dienTich() -> Float {
        return canh * canh
    }
}

class HinhTamGiac: HaiChieu {
    var canh1: Float
    var canh2: Float
    var canh3: Float

    init(canh1: Float, canh2: Float, canh3: Float) {
        if canh1 < 0 || canh2 < 0 || canh3 < 0 {
            print("Error: Không được nhập cạnh âm. Khởi tạo giá trị mặc định cạnh = 0.")
            self.canh1 = 0
            self.canh2 = 0
            self.canh3 = 0
        } else {
            self.canh1 = canh1
            self.canh2 = canh2
            self.canh3 = canh3
        }
    }

    func chuVi() -> Float {
        return canh1 + canh2 + canh3
    }

    func dienTich() -> Float {
        let p: Float = chuVi() / 2
        return sqrtf(p * (p - canh1) * (p - canh2) * (p - canh3))
    }
}

protocol BaChieu: HinhVe {
    func theTich() -> Float
}

class HinhCau: BaChieu {
    var banKinh: Float

    init(banKinh: Float) {
        if banKinh < 0 {
            print("Error: Không được nhập bán kính âm. Khởi tạo giá trị mặc định bán kính = 0.")
            self.banKinh = 0
        } else {
            self.banKinh = banKinh
        }
    }

    func theTich() -> Float {
        return 4 / 3 * Float.pi * powf(banKinh, 3)
    }

    func dienTich() -> Float {
        return 4 * Float.pi * powf(banKinh, 2)
    }
}

class HinhLapPhuong: BaChieu {
    var canh: Float

    init(canh: Float) {
        if canh < 0 {
            print("Error: Không được nhập cạnh âm. Khởi tạo giá trị mặc định cạnh = 0.")
            self.canh = 0
        } else {
            self.canh = canh
        }
    }

    func theTich() -> Float {
        return powf(canh, 3)
    }

    func dienTich() -> Float {
        return 6 * powf(canh, 2)
    }
}

//Hình 2 chiều
let tron = HinhTron(banKinh: 2)
tron.chuVi()
tron.dienTich()

let vuong = HinhVuong(canh: 3)
vuong.chuVi()
vuong.dienTich()

let tamgiac = HinhTamGiac(canh1: 3, canh2: 4, canh3: 5)
tamgiac.chuVi()
tamgiac.dienTich()

//Hình 3 chiều
let cau = HinhCau(banKinh: 2.5)
cau.dienTich()
cau.theTich()

let lapphuong = HinhLapPhuong(canh: 3.5)
lapphuong.dienTich()
lapphuong.theTich()
