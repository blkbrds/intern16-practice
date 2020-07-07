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
        if ngay < 0 || ngay > daysln(month: thang) {
            return nil
        }
        if thang > 12 {
            return nil
        }
        if nam < 1 {
            return nil
        }
        return self
    }
    
    func advance(y: Int, m: Int, d: Int) -> Date {
        if d + 5 > daysln(month: m) {
            return Date(ngay: 1, thang: m + 1, nam: y)
        }
        if d + 5 > daysln(month: m) && y == 12 {
            return Date(ngay: 1, thang: 1, nam: y + 1)
        }
        return Date(ngay: d + 5, thang: m, nam: y)
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
var bonus = Date(ngay: 4, thang: 4, nam: 2020).advance(y: 2020, m: 4, d: 5)
