import UIKit
import Foundation

var arr:[Int] = [0,1,2,3,4,5,6,7,8,9]
arr.shuffle()

for i in 0..<arr.count {
    print("\(arr[i])")
}
