import UIKit
import Foundation

class Date {
    var day: Int
    var month: Int
    var year: Int

    init?(day: Int, month: Int, year: Int) {
        if day > 31 || month > 12 || year < 0 {
            return nil
        }
        self.day = day
        self.month = month
        self.year = year
    }

    func daysIn() -> Int {
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 4, 6, 9, 11:
            return 30
        case 2:
            if year % 4 == 0 && year % 100 != 0 {
                return 29
            } else {
                return 28
            }
        default:
            return 0
        }
    }

    func normalize() -> Bool {
        if day <= self.daysIn() {
            return true
        } else {
            return false
        }
    }

    func advance() -> Date? {
        if self.normalize() == false {
            return nil
        } else {
            if day == self.daysIn() {
                if month == 12 {
                    year = year + 1
                    month = 1
                    day = 1
                } else {
                    month = month + 1
                    day = 1
                }
            } else {
                day = day + 1
            }
            return Date(day: day, month: month, year: year) ?? nil
        }
    }

    func printDate() -> String {
        return "Ngày: \(day) - Tháng: \(month) - Năm: \(year)"
    }
}

if let a = Date(day: 32, month: 13, year: 2008) {
    if let advance = a.advance() {
        print(advance.printDate())
    } else {
        print("Không thể thực hiện thao tác do ngày tháng năm không hợp lệ.")
    }
} else {
    print("Không thể thực hiện thao tác do ngày tháng năm không hợp lệ.")
}


