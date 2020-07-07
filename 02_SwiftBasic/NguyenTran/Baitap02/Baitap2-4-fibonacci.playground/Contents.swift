import UIKit
import Foundation

func fib(n: Int) -> Int {
    if n <= 2 {
        return 1
    }
    else {
        return fib(n: n - 1) + fib(n: n - 2)
    }
}

var sum: Int = 0

for index in 1...10 {
    sum = sum + fib(n: index)
}

print("Tong cua 10 so Fibonacci dau tien la \(sum)")
print("\n10 so Fibonacci dau tien la")

for index in 1...10 {
    print(fib(n: index))
}
