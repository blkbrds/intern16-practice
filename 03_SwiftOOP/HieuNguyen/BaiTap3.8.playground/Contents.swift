import UIKit

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
        if ngay < 0 || ngay > daysln(thang: thang) { return nil }
        if thang < 0 || thang > 12 { return nil }
        if nam < 1 { return nil }
        return self
    }
    
    func namNhuan() -> Bool {
        return nam % 400 == 0 || (nam % 4 == 0 && nam % 100 != 0 )
    }
    
    func daysln(thang: Int) -> Int{
        switch thang {
        case 1,3,5,7,8,10,12:
            return 31
        case 4,6,9,11:
            return 30
        case 2:
            return namNhuan() ? 29 : 28
        default:
            return 31
        }
    }
    
    func advance(y: Int, m: Int, d: Int) -> Date{
        //var day:Int = d
        if d + 1 > daysln(thang: m){
            if  m == 12 {
                return Date(ngay: 1, thang: 1, nam: y + 1)
            } else {
                return Date(ngay: 1, thang: m + 1, nam: y + 1)
            }
        } else {
            return Date(ngay: d + 1, thang: m, nam: y)
        }
    }
    
    func printDate() {
        print("ngay \(self.ngay) thang \(self.thang) nam \(self.nam)")
    }
}
var date = Date(ngay: 28, thang: 2, nam: 1994).normalize()
print(date?.printDate())

