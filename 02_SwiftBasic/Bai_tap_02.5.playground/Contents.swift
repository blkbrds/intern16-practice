import UIKit
import Foundation

func checkChuoi ()  {
   let s = "swift and swift hello and hello"
    let s2 = "swift hello"
   let sosanh =  s.components(separatedBy:s2)
   print(sosanh.count - 1)
 
}
checkChuoi()
