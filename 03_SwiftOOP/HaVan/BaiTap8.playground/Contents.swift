import Foundation


class Date {
    var ngay: Int
    var thang: Int
    var nam: Int
        
    init(ngay date: Int, thang month: Int, nam year: Int) {
        ngay = date
        thang = month
        nam = year
    }
    
    // số ngày trong tháng
    func daysIn() -> Int {
        switch thang {
            case 1,3,5,7,8,10,12:
                return 31
            case 4,6,9,11:
                return 30
            case 2:
                if (nam % 400 == 0) || (nam % 4 == 0 && nam % 100 != 0) {
                    return 29
                } else {
                    return 28
                }
            default:
                return -1
        }
    }

    // chuẩn hoá dữ liệu
    func nomalized() -> Bool {
        if thang <= 12 && thang >= 1 && nam > 0 && ngay <= daysIn() {
            return true
        } else {
            return false
        }
    }
    
    // tăng 1 ngày
    func advance() -> (Int?, Int?, Int?) {
        if nomalized() {
            if thang == 12 && ngay == 31 {
                ngay = 1
                thang = 1
                nam = nam + 1
            } else if ngay == daysIn() {
                ngay = 1
                thang = thang + 1
            } else {
                ngay = ngay + 1
            }
                return (ngay, thang, nam)
            } else {
            return (nil, nil, nil)
        }
    }
        
    // in ngày tháng năm
    func print() -> String {
        if nomalized() {
            return "ngày \(ngay) tháng \(thang) năm \(nam)"
        } else {
             return "ngày bạn nhập không đúng"
        }
           
    }
}

//MARK: Kiểm tra

let ngay = Date(ngay: 31, thang: 12, nam: 2010)
print(ngay.print())
let ngayTiepTheo = ngay.advance()
if let ngayTT = ngayTiepTheo.0 , let thangTT = ngayTiepTheo.1 , let namTT = ngayTiepTheo.2 {
    print("ngày \(ngayTT) tháng \(thangTT) năm \(namTT)")
} else {
    print("ngày bạn nhập không đúng nên không thể suy ra ngày tiếp theo")
}


    

