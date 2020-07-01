import UIKit


// Ramdom mang dung hàm shuffled()
func inMang(mang : [Int]){
    var a = mang
    a = a.shuffled()
    print (a)
}

inMang(mang: [1,2,3,4,5])
