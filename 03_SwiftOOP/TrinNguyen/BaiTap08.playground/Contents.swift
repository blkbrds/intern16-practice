import Foundation

class Date {

    var day: Int
    var month: Int
    var year: Int

    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }

    func inDate() {
        print("Ngay: \(day), Thang: \(month) , Nam: \(year)")
    }

    func daySln() -> Int {
        if month >= 1 && month <= 12 {
            switch month {
            case 1, 3, 5, 7, 8, 10, 12:
                return 31
            case 4, 6, 9, 11:
                return 30
            default:
                return 28
            }
        }
        return 0
    }

    func normalize() {
        if month > 12 {
            month = month - 12
            year += 1
            let ngaydo = daySln()
            if day > ngaydo {
                day = day - ngaydo
                month += 1
                if month > 12 {
                    month = month - 12
                    year += 1
                }
            }
        } else if day > daySln() {
            day = day - daySln()
            month += 1
            if month > 12 {
                month = month - 12
                year += 1
            }
        }
    }

    func getAdvanceDay(d: Int, m: Int, y: Int) -> Date {
        let date = Date(day: day + d, month: month + m, year: year + y)
        date.normalize()
        return date
    }
}

var date = Date(day: 32, month: 2, year: 1998)
date.daySln()
date.normalize()
date.getAdvanceDay(d: 12, m: 8, y: 8)
