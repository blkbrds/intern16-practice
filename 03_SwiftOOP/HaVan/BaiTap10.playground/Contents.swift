import Foundation

enum KiemTra {
    case soAm
    case soDuong(UInt)
}
class TongDaySo {
    var gioiHan: Int

    init(with n: Int) {
        gioiHan = n
    }
    
    func tinhTong() -> KiemTra {
        var s:UInt = 0
        if gioiHan <= 0 {
            return .soAm
        } else if gioiHan == 1 {
            return .soDuong(1)
        } else {
            for index in 1...gioiHan {
                s += UInt(index)
            }
            return .soDuong(s)
        }
    }
}
//MARK: kiểm tra kết quả
var day = TongDaySo(with: 0)
var ketQua = day.tinhTong()
switch ketQua {
    case .soAm:
        print("Nhập n không hợp lệ (n > 0)")
    case .soDuong(let s):
        print("Tổng dãy số là: \(s)")
}
