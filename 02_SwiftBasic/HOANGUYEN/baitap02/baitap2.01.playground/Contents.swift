import UIKit
import Foundation

func calCircle ( _ r:Float) -> (Float,Float){
//    Tinh dien tich
    let A = Float.pi * powf(r, 2) * 4
//    Tinh the tich
    let V = Float.pi * powf(r, 3) * 4 / 3
    return (A,V)
}

calCircle(2.3)
