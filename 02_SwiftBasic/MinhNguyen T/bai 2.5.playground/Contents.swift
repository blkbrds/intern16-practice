import UIKit



// Tim so lan xuat hien chuoi con trong chuoi me
func timChuoi(chuoiMe: String, chuoiCon: String) -> Int{
    var soLan: Int = 0
    let mangA: [Character] = Array(chuoiMe)
    let mangB: [Character] = Array(chuoiCon)
    for i in 0...mangA.count - mangB.count{
        if [Character](mangA[i..<(i + mangB.count)]) == mangB
        {
            soLan = soLan + 1
            
        }
    }
    return soLan
}
