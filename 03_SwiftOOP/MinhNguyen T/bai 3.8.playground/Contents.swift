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
    
    func kiemTraNamNhuan(nam: Int) -> Bool {
        if nam % 4 == 0 && nam % 100 != 0 || nam % 400 == 0{
            return true
        }
        return false
    }
    
    func hamtruycap() -> String {
        return "Ngay: \(ngay) , Thang: \(thang), Nam: \(nam)"
    }
    
    // Tra ve so ngay trong thang
    func dayIn() -> Int {
        switch thang {
        case 1 , 3 , 5 , 7 , 8 , 10 , 12:
            return 31
        case 4 , 6 , 9 , 11:
            return 30
        case 2:
            if kiemTraNamNhuan(nam: nam) == true{
                return 29
            }
            return 28
        default:
            return -1
        }
    }
    
    // Chuan hoa ngay thang nam
    func normalize()-> Bool {
        var result: Bool = true
        if nam < 0 && nam < thang && thang <= 1 && thang >= 12 && ngay <= 1 && ngay > dayIn() {
            result = false
        }
        return result
    }
    
    // Tang ngay thang nam hien tai
    func advance() -> (Int?, Int?, Int?){
        if thang == 12 && ngay == dayIn(){
            ngay = 1
            thang = 1
        }else if ngay < dayIn(){
            ngay = ngay + 1
        }else if thang < 12{
            thang = thang + 1
        }
        return (ngay, thang, nam)
    }
}

var day = Date(ngay: 2, thang: 2, nam: 2020)
day.dayIn()
day.advance()
day.hamtruycap()

