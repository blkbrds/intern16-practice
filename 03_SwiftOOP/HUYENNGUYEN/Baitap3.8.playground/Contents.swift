import UIKit

class Date {
    var ngay: Int, thang: Int, nam: Int

    init(_ ngay: Int,_ thang: Int,_ nam: Int) {
        self.ngay = ngay
        self.thang = thang
        self.nam = nam
    }

    func print() -> String {
        return "\(self.ngay)/\(self.thang)/\(self.nam)"
    }

    func trongThang() -> Int {
        var soNgay: Int = 0
        switch self.thang {
        case 1, 3, 5, 7, 8, 10, 12:
            soNgay = 31
        case 4, 6, 9, 11:
            soNgay = 30
        case 2:
            soNgay = 28
        default: break
        }
        return soNgay
    }

    func normalize() -> String {
        var notificationString = "Không hợp lệ"
        guard ngay < trongThang() else {
            notificationString = "Không hợp lệ"
            return notificationString
        }
        guard thang < 12 else {
            notificationString = "Không hợp lệ"
            return notificationString
        }
        guard nam > 1 else {
            notificationString = "Không hợp lệ"
            return notificationString
        }
        return notificationString
    }

    func advance(_ d: Int,_ m: Int,_ y: Int) {
        self.ngay = d
        self.thang = m
        self.nam = y
    }
}

let ngaySinh: Date = Date(07, 09, 1998)
print(ngaySinh.print())
print("Số ngày trong tháng sinh \(ngaySinh.trongThang())")
print(ngaySinh.normalize())

ngaySinh.advance(29, 06, 2020)
print(ngaySinh.print())
