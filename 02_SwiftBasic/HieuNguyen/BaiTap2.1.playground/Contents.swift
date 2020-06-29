import UIKit
import Foundation
func hinhcau (bankinh : Float) -> (Float,Float){
    let pi = Float.pi
    let dientich:Float = 4 * pi * pow(bankinh, 2)
    let thetich:Float = ( 4 / 3 ) * pi * pow(bankinh, 3)
    
    return(dientich,thetich)
}
print("Dien tich: \(hinhcau(bankinh: 10).0) \nThe tich: \(hinhcau(bankinh: 10).1)")
