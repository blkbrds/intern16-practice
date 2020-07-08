

import UIKit

//baitap 1 calculate area and volumn of a cicle
func Ciclecalculate (to radius: Double) -> (area: Double, volumn: Double) {
    let area: Double = 4 * Double.pi * radius * radius
    let volumn: Double = (4.0 / 3.0) * Double.pi * radius * radius * radius
    return (area, volumn)
}

let aa = Ciclecalculate(to: 3)
print (aa.area, aa.volumn)
//baitap 1 calculate area and volumn of a cicle

//Bai tap so 7 // hoan doi random cac phan tu trong array
var number: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
number.reverse()
print(number)
// print dao nguoc thu tu cac element cua array

let descendingnumber = number.sorted(by: <)
print(descendingnumber)
//sap xep cac element theo thu tu tang dan

number.shuffle()
//sap xep cac element theo random ngau nhien

let shuffledNumbers = number.shuffled()
//xao tron cac element

number.swapAt(2, 3)
//Xao tron cac element bang cach chi dinh index cua element

number.swapAt(4, 5)
//Xao tron cac element bang cach chi dinh index cua element (vi du khac)
