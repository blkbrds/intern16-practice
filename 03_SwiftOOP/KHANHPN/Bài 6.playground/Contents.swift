import UIKit

class HinhVe {
    func dienTich () -> String {
        return "Dien tich"
    }

    func chuVi () -> String {
        return "Chu vi"
    }
}

class HaiChieu: HinhVe {

}

class HinhTron: HaiChieu {
    override func chuVi() -> String {
        return "Chu vi hinh tron"
    }

    override func dienTich() -> String {
        return "Dien tich hinh tron"
    }
}

class HinhVuong: HaiChieu {
    override func chuVi() -> String {
        return "Chu vi hinh vuong"
    }

    override func dienTich() -> String {
        return "Dien tich hinh vuong"
    }

}

class TamGiac: HaiChieu {
    override func chuVi() -> String {
        return "Chu vi tam giac"
    }

    override func dienTich() -> String {
        return "Dien tich tam giac"
    }
}

class BaChieu: HinhVe {
    func theTich () -> String {
        return "Hinh cau"
    }
}

class HinhCau: BaChieu {
    override func dienTich() -> String {
        return "Dien tich hinh cau"
    }

    override func theTich() -> String {
        return "The tich hinh cau"
    }
}

class LapPhuong: BaChieu {
    override func dienTich() -> String {
        return "Dien tich hinh lap phuong"
    }

    override func theTich() -> String {
        return "The tich hinh lap phuong"
    }
}
