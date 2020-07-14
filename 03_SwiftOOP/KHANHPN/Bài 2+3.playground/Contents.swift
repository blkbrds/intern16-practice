import UIKit
import Foundation

class DaGiac {
    var soCanh: Int
    var size: Array<Int>

    init(soCanh: Int, size: Array<Int>) {
        self.soCanh = soCanh
        self.size = size
    }

    func ChuVi() -> Int {
        var sum: Int = 0
        for i in 0..<soCanh {
            sum = sum + size[i]
        }
        return sum
    }
    func xuat() {
        for i in 0..<soCanh {
            print("\(size[i])")
        }
    }
}


/*
class TamGiac: DaGiac {
    var a: Int, b: Int, c: Int
    override init(a: Int, b: Int, c: Int) {
        super.size[0] = a
        super.size[1] = b
        super.size[2] = c
    }
    override func ChuVi() -> Int {
        var sum: Int = 0
        let a = size[0]
        let a = size[0]
        return sum
    }
    
    func DienTich() -> Double {
        let p = 1/2*(size[0] + size[1] + size[2])
        let s = sqrt(p * (p - size[0]) * (p - size[1]) * (p - size[2]))
        return s
    }
}
*/

class TamGiac: DaGiac {
  init?(size: [Int]) {
    guard size.count == 3 else { return nil }
    super.init(soCanh: 3, size: size)
  }

  override func ChuVi() -> Int {
    super.ChuVi()
  }

  func dienTich() -> Double {
    let p = Double(ChuVi()) / 2
    return sqrt(p * (p - Double(size[0])) * (p - Double(size[1])) * (p - Double(size[2])))
  }
}

func ktTamGiacPytago(tamgiac: TamGiac) -> Bool {
  if tamgiac.size[0] * tamgiac.size[0] + tamgiac.size[1] * tamgiac.size[1] == tamgiac.size[2] * tamgiac.size[2] ||
  tamgiac.size[0] * tamgiac.size[0] + tamgiac.mangCsizeanh[2] * tamgiac.size[2] == tamgiac.size[1] * tamgiac.size[1] ||
  tamgiac.size[2] * tamgiac.size[2] + tamgiac.size[1] * tamgiac.size[1] == tamgiac.size[0] * tamgiac.size[0] {
    return true
  }
  return false
}

func tamGiacPytago(in tamgiacs: [TamGiac]) {
  for tamgiac in tamgiacs where ktTamGiacPytago(tamgiac: tamgiac) {
    print(tamgiac.size)
  }
}


