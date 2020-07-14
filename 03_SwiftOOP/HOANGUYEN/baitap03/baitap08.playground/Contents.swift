import UIKit

struct Date {
    var day: UInt
    var month: UInt
    var year: UInt
    
    enum checkDate {
        case hople(Date)
        case khonghople
    }
    func fCheckDate(date: Date) -> checkDate {
        switch date.month {
        case 2:
            if date.year % 4 == 0 {
                if date.day <= 29 {
                    return .hople(date)
                }
            }
            else {
                if date.day <= 29 {
                    return .hople(date)
                }
            }
            return .khonghople
        case 4, 6, 9 ,11:
            if date.day <= 30 {
                return .hople(date)
            }
            return .khonghople
        case 1, 3, 5, 7, 8, 10, 12:
            if date.day <= 31 {
                return .hople(date)
            }
            return .khonghople
        
        default: return .khonghople
        }
    
    }
    
    init(day: UInt, month: UInt, year: UInt) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func normalize() -> Date? {
        let ck = self.fCheckDate(date: self)
        switch ck {
        case .khonghople:
            print("Nhập sai")
            return nil
        default:
            return self
        }
    }
    func daysIn(i: UInt) -> UInt {
       
        switch i {
            
        case 2:
            if year % 4 == 0 {
                return 29
        }
        else {
                return 28
        }
        case 4, 6, 9 ,11:
            return 30
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        
        default: return 0
        }
    }
    func advance() -> Date? {
        switch self.day {
               case 28:
                   if month == 2 {
                    if year % 4 != 0 {
                        return Date(day: 1 , month: self.month + 1 , year: self.year)
                    }
                   }
                    return Date(day: self.day + 1 , month: self.month , year: self.year)
               case 29:
                   if month == 2 {
                        return Date(day: 1 , month: self.month + 1 , year: self.year )
                    }
                    return Date(day: day + 1  , month: self.month , year: self.year )
 
            case 30:
                if month == 4 || month == 6 || month == 9 || month == 11 {
                    return Date(day: 1 , month: self.month + 1 , year: self.year)
                }
               
            default:
                if day == 31 {
                    if self.month == 12 {
                        return Date(day: 1 , month: 1 , year: self.year + 1)
                    }
                    else {
                        return Date(day: 1 , month: self.month + 1, year: self.year)
                    }
                }
                return Date(day: self.day + 1 , month: self.month, year: self.year)
        }
        return nil
    }
}
    
let a = Date(day: 31, month: 12, year: 2020)
a.normalize()
a.daysIn(i: 2)
a.advance()
