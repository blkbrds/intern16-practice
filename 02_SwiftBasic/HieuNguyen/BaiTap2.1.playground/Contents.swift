import UIKit
import Foundation
func hinhcau (bankinh : Float) -> (Float,Float){
    let pi = Float.pi
    let dientich:Float = 4 * pi * bankinh * bankinh
    let thetich:Float = ( 4 / 3 ) * pi * bankinh * bankinh * bankinh
    
    return(dientich,thetich)
}
print("Dien tich: \(hinhcau(bankinh: 10).0) \nThe tich: \(hinhcau(bankinh: 10).1)")
