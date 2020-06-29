import UIKit

class A{
    static func Sum(n:Int){
        var sum:Int = 0
        for i in 0...n{
            sum += i
        }
        print ("tong :\(sum)")
    }
}
A.Sum(n: 5)

