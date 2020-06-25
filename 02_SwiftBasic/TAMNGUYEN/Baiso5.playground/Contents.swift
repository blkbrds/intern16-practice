import UIKit
func Find(){
    let str1 = "em yeu anh em yeu anh"
    let str2 = "anh"
    let a = str1.components(separatedBy: str2)
    print("So lan xuat hien:\(a.count - 1)")
}

Find()
