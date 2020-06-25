import UIKit

//bai 1&2 tim 10 so fibonacy va tinh tong
func fibonacy(n: Int) -> (Int)
{
    if n < 0 {
        return -1
    } else if (n == 0 || n == 1) {
        return n
    } else {
        return fibonacy(n: n - 1) + fibonacy(n: n - 2);
    }
}
var n = 0
var tong = 0
while(n < 10) {
    print("Day so fibonaci la: \(fibonacy(n: n))")
    tong += fibonacy(n: n)
    n += 1
}
print("Tong 10 so fibonaci la: \(tong)")

//bai 4 liet ke so hanh phuc be hon 100000


func tongBinhPhuong(n: Int) -> (Int) {
    var rem = n
    var tong = 0
    var temp = 0
    //sodautien vao
    while rem > 0 {
        //lay so cuoi
        temp = rem % 10
        //congtonglen
        tong += (temp * temp)
        rem = rem / 10
    }
    return tong
}
func ktSoHP(n: Int) -> (Int) {
    var rem = n
    var arrayTemp = [Int]()

    while(rem != 1 && rem != 4) {
        rem = tongBinhPhuong(n: rem);
    }
    if(rem == 1) {
        arrayTemp.append(rem)
    }
    //Unhappy number ends in a cycle of repeating numbers which contains 4
        else if(rem == 4) {
            return 0
    }
    print(arrayTemp)
    return rem
}
func lietKeSoHP(n: Int) {
    for index in 1...100 {
        ktSoHP(n: index)
    }
}
