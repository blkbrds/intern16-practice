import Foundation

class Date {
    var ngay: Int
    var thang: Int
    var nam: Int
    
    init(ngay: Int, thang: Int, nam: Int) {
        self.ngay = ngay
        self.thang = thang
        self.nam = nam
    }
    
    func normalize() -> Date? {
        if ngay < 0 || ngay > daysln(month: thang) && thang > 12 && nam < 1 {
            return nil
        }
        return self
    }
    
    func advance(year: Int, month: Int, day: Int) -> Date {
        if day + 5 > daysln(month: month) {
            return Date(ngay: 1, thang: month + 1, nam: year)
        }
        if day + 5 > daysln(month: month) && year == 12 {
            return Date(ngay: 1, thang: 1, nam: year + 1)
        }
        return Date(ngay: day + 5, thang: month, nam: year)
    }
    
    func daysln(month: Int) -> Int {
        switch month {
        case 1,3,5,7,8,10,12:
            return 31
        case 4,6,9,11:
            return 30
        default:
            return 28
        }
        
        
    }
}
var day = Date(ngay: 5, thang: 4, nam: 1988).normalize()
var bonus = Date(ngay: 4, thang: 4, nam: 2020).advance(year: 2020, month: 4, day: 5)
