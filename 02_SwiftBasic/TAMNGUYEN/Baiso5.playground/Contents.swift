import UIKit

func find() {
    let str1 = "em yeu anh em yeu anh em yeu anh nhieu lam ghet anh yeu anh"
    let str2 = "anh"
    let a = str1.components(separatedBy: str2)
    print(a)
    print("So lan xuat hien:\(a.count - 1)")
}

find()
