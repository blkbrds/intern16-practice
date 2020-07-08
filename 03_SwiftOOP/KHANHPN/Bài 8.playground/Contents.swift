import UIKit

class Date {
    var day: Int
    var month: Int
    var year: Int

    init (day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }

    func leapYear(year: Int) -> Bool {
        if year % 400 == 0 || year % 4 == 0 && year % 100 != 0 {
            return true
        }
        return false
    }

    func daysln(month: Int) -> Int {
        switch month {
        case 4, 6, 9, 11:
            return 30
        case 2:
            if leapYear(year: year) == true {
                return 29
            }
            return 28
        default:
            return 31
        }
    }
    
    func normalize () -> Date? {
        if day > daysln(month: month) || day < 0 {
            return nil
        }
        if month < 0 || month > 12 {
            return nil
        }
        if year < 0 {
            return nil
        }
        return Date(day: day, month: month, year: year)
    }
    
    func advance (y: Int, m: Int, d: Int) -> Date {
        if d + 1 > daysln(month: m) {
            if m == 12 {
                return Date(day: 1, month: 1, year: y + 1)
            } else {
                return Date(day: 1, month: m + 1, year: y)
            }
        } else {
            return Date(day: d + 1, month: m, year: y)
        }
    }
}

var date1 = Date(day: 31, month: 12, year: 2020)

