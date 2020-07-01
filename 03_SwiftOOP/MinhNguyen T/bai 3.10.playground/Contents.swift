import Foundation

class A{
    func Sum(n:Int){
        var sum:Int = 0
        for i in 0...n{
            sum += i
        }
        print ("tong :\(sum)")
    }
}
var a = A()
a.Sum(n: 6)
