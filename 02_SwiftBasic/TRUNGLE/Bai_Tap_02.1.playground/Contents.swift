import UIKit
import Foundation

func tinhTheTichVaDienTich (r : Int) -> (dientich: Double, thetich: Double) {
    let dienTich  =  Double(( 4 * Double.pi * pow(Double(r),2))).rounded()
    let theTich = Double ((4/3 * Double.pi * pow(Double(r),3))).rounded()
    return (dienTich, theTich)
}
let hinhtron = tinhTheTichVaDienTich(r: 6)
print("dien tich hinh cau: \(hinhtron.dientich)")
print("the tich hinh cau: \(hinhtron.thetich)")
