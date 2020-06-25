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

