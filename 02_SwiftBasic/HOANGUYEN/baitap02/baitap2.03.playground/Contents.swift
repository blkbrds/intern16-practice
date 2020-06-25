import UIKit
import Foundation

//giai he phuong trinh bac 1 co 2 an
func hptb1 (_ a1:Float, _ b1:Float,_ c1:Float, _ b2:Float, _ c2:Float, _ a2:Float) -> Any {
    if a1 * b2 == a2 * b1 {
        if c1 == c2 {
            return "x,y Vô số nghiệm"
        }
        else {
            return "Vô nghiệm"
        }
    }
    else {
        return ((b2 * c2 - b1 * c1)/(a1 * b2 - a2 * b1), (a2 * c1 - a1 * c2)/(a2 * b1 - a1 * b2) )
    }
}

hptb1(1, 3, -2, 4, 1, 7)
