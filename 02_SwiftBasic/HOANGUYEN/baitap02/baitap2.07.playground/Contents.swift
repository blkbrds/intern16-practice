import UIKit

//Thay thế các phần tử của mảng bằng có giá trị = element =  1 giá trị khác
func replaceToSub ( arr: inout Array<Int>, element:Int, sub:Int) -> Array<Int> {
    var i:Int = 0
    while i < arr.count {
        if arr[i] == element {
            arr[i] = sub
        }
        i += 1
    }
    return arr
}
var arr:Array<Int> = [1,2,4,3,5,1,2,6,2,4]
replaceToSub(arr: &arr, element: 1, sub: 10)

