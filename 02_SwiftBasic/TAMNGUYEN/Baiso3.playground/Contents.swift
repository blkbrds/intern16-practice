import UIKit
// giai he phuong trinh bac nhat 2 an
var x: Float
var y: Float
func d(a1: Float,a2: Float,b1: Float,b2: Float) -> Float{
    return Float(a1 * b2 - a2 * b1)
}
func dX(b1: Float,b2: Float,c1: Float,c2: Float) -> Float{
    return Float(c1 * b2 - c2 * b1)
}
func dY(a1: Float,a2: Float,c1: Float,c2: Float) -> Float{
    return Float(a1 * c2 - a2 * c1)
}
let kqD = d(a1: 1, a2: 2, b1: 3, b2: 4)
let kqdX = dX(b1: 3, b2: 4, c1: -1, c2: -2)
let kqdY = dY(a1: 1, a2: 2, c1: -1, c2: -2)
if (kqD == 0 ){
    if(kqdX + kqdY == 0)
    {print("he phuong trinh co vo so nghiem")}
    else{
        print("he phuong trinh vo nghiem")
    }
}
else{
    x = kqdX / kqD
    y = kqdY / kqD
    print("he phuong trinh co nghiem (x,y) = \(x),\(y)")
}
