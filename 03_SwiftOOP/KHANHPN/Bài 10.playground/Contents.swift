import UIKit

class A {
  static func tinhTong(n: Int) -> Int {
    var s = 0
    for i in 1...n {
      s += i
    }
    return s
  }
}

A.tinhTong(n: 10)
