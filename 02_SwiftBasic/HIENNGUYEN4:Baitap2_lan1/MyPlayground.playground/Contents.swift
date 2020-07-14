import UIKit


//tìm ra 100 số đầu tiên của mảng số sử dụng hàm vòng lặp và tính tổng
func fib()-> [Double]{
    
    var f1 = 0.0
    
    var f2 = 1.0
    
    var f  = 0.0
    
    var araryOfFibs = [Double]()
    
    repeat {
        
        araryOfFibs.append(f)
        
        f = f1 + f2
        
        f1 = f2
        
        f2 = f
        
    } while araryOfFibs.count < 100

    return araryOfFibs
}

func sumOf(numbers: [Double]) -> Double {
    var sum = 0.0
    for number in numbers {
        sum += number
    }
    return sum
}

let fa = fib()
let sum = sumOf(numbers: fa)
print(fa.count)
print(sum)


//Bài 7: Given an array of integers, replace all the occurrences of elemToReplace with substitutionElem.

var arrString = ["1", "2", "3", "1", "4", "1"]
var elemToReplace = "1"
var substitutionElem = "3"
for i in 0..<arrString.count {
    if arrString[i] == elemToReplace {
        let newString = arrString[i].replacingOccurrences(of: arrString[i], with: substitutionElem)
        arrString[i] = newString
    } else {
        arrString[i] = arrString[i]
    }
}
print(arrString)
    


//bai 5: Tìm chuỗi con trong chuỗi mẹ
let string = "cdefgvabfeghvbgggjhgabffggab"
let substring = "ab"
if string.contains(substring) {
    print(substring.count)
}










