import UIKit
import Foundation
class Date {
     var day = 1
     var month = 1
     var year = 1
     var monthPrint = 1
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
     func normalize() -> Bool {
        return day <= 31 && day >= 1 && month <= 12 && month >= 1 && year >= 1
    }
    
     func daysln(month: Int) -> Int {
        guard normalize() else {
            return 0
        }
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            monthPrint = month
            return 31
        case 2:
            guard (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 else {
                monthPrint = month
                return 28
            }
            monthPrint = month
            return 29
        case 4, 6, 9, 11:
            monthPrint = month
            return 30
        default:
            return 0
        }
    }
    
     func advance() -> Void {
        var d = 0
        var m = 0
        var y = 0
        if normalize() {
            if month == 12{
                if day == 31 {
                    d = day - 30
                    m = month - 11
                    y = year + 1
                } else {
                    d = day + 1
                    m = month
                    y = year
                }
            } else if month == 1, month == 3, month == 5, month == 7, month == 8, month == 10 {
                if day == 31 {
                    d = day - 30
                    m = month + 1
                    y = year
                } else {
                    d = day + 1
                    m = month
                    y = year
                }
            } else if month == 4, month == 6, month == 9, month == 11 {
                if day == 31 {
                    d = day - 30
                    m = month + 1
                    y = year
                } else {
                    d = day + 1
                    m = month
                    y = year
                }
            } else {
                if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
                    if day == 29 {
                        d = day - 28
                        m = month + 1
                        y = year
                    } else if day == 30, day == 31 {
                        d = 0
                        m = 0
                        y = 0
                    } else {
                        d = day + 1
                        m = month
                        y = year
                    }
                } else {
                    if day == 28 {
                        d = day - 27
                        m = month + 1
                        y = year
                    } else if day == 29, day == 30, day == 31 {
                        d = 0
                        m = 0
                        y = 0
                    } else {
                        d = day + 1
                        m = month
                        y = year
                    }
                }
            }
        }
        print("Next Date: \(d) - \(m) - \(y)")
    }
    
     func InNgayThangNam() {
        if normalize() {
            print("Date: \(day) - \(month) - \(year)")
        }
    }
}

var date1 = Date(day: 10, month: 04, year: 1997)
var dayPrint = date1.daysln(month: 4)
date1.InNgayThangNam()
print("Number of day in month \(date1.monthPrint) of \(date1.year) is : \(dayPrint)")
date1.advance()
