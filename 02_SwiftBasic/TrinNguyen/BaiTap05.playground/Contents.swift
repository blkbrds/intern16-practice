import UIKit

func timChuoiCon() {
    let chuoiCha: String = "abacababababass"
    let chuoiCon: String = "ab"
    //tach ab cua chuoi con ra chuoi cha
    let chuoiConCoTrongCha: [String] = chuoiCha.components(separatedBy: "ab")
    //dem so lan xuat hien bang cach lay chuoi cha tru cho cac chuoi con lai
    print(chuoiConCoTrongCha.count - 1)
}
timChuoiCon()
