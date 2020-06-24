import Foundation
func giaihe(a1 : Int, b1: Int, c1: Int, a2:Int, b2:Int, c2:Int) -> (Any, Double?){
    let d = a1*b2 - a2*b1
    let dx = c1*b2 - c2*b1
    let dy = c1*a2 - a2*c1
    if d == 0 {
     if dx == 0 && dy == 0{
        return ("vô số", nil)
        }
    else {
        return ("vô nghiệm", nil)
        }
    }
    else {
        return (Double(dx/d), Double(dy/d))
    }

}
let kq = giaihe(a1: 0, b1: 0, c1: 0, a2: 0, b2: 0, c2: 0)
var x1 = kq.0

    if let x2 = kq.1{
        print("Nghiệm của phương trình là x1= \(x1) ; x2= \(x2)" )
    }
    else {
        print("Nghiệm của phương trình là : \(x1)")
    }

