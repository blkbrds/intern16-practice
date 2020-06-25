import UIKit
import Foundation

func calSherical (r : Int) -> (dientich: Double, thetich: Double) {
    let dienTich  =  Double(( 4 * Double.pi * pow(Double(r),2))).rounded()
    let theTich = Double ((4/3 * Double.pi * pow(Double(r),3))).rounded()
    return (dienTich, theTich)
}
let sherical = calSherical(r: 6)
print("dien tich hinh cau: \(sherical.dientich)")
print("the tich hinh cau: \(sherical.thetich)")
