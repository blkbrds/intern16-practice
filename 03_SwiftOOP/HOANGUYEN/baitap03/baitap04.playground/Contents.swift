import UIKit
import Foundation

class TamGiacPytago {
    var arr: Array<Array<Int>>
    init(arrTG: Array<Array<Int>>) {
        self.arr = arrTG
    }
    
    func ckPytago() {
        for i in 0..<arr.count {
            arr[i].sort()
            if arr[i][2] * arr[i][2] == arr[i][0] * arr[i][0] + arr[i][1] * arr[i][1] {
                print(arr[i])
            }
        }
    }
}

//bắt buộc nhập đúng 3 cạnh: nếu nhập thiếu thì out of range còn nhập thừa thì tính tào lao =))
let a = TamGiacPytago(arrTG: [[1,2,3],[4,5,7],[3,5,4],[2,1,2],[6,10,8]])
a.ckPytago()
