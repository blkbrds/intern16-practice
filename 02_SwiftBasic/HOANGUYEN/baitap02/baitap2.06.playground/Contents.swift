import Foundation

//shuffle 1 mảng
func shuffleArr(_ arr: inout Array<Int>)  -> Array<Int> {
    let n: Int = arr.count
    var i: Int = 0
    var j: Int = 0
    while i < n {
        j = Int.random(in: 0 ..< n)
        let temp: Int = arr[j]
        arr[j] = arr[i]
        arr[i] = temp
        i += 1
    }
    return arr
}

var a:Array<Int> = [1,2,3,4,5,6,7,8,9]

shuffleArr(&a)
