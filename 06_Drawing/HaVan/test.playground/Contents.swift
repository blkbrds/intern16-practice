import UIKit



func mySubstring(inputString: String, l: Int, r: Int){
var str = inputString
    let catbot = str.startIndex...str.index(str.startIndex, offsetBy:r)
   str.removeSubrange(catbot)
    print(str)
}
mySubstring(inputString: "abcds", l: 2, r: 1)
