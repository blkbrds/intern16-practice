import UIKit

struct Mang1C {
    var array: Array<Int>
    
    init(_ array : Array<Int>) {
        self.array = array
    }
    
    func printArray () {
        for i in array {
            print(i)
        }
    }
    
    func minMax () -> (min: Int, max: Int) {
        var min = array[0]
        var max = array[0]
        for i in 1..<array.count {
            if min > array[i]{
                min = array[i]
            }
            if max < array[i] {
                max = array[i]
            }
        }
        return (min, max)
    }
}

let a: Mang1C = Mang1C([1,4,3,5,8,6,7])
a.printArray()
a.minMax()
