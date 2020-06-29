import UIKit
import Foundation
class Mang1c {
    var array: [Int]
    init(array: [Int]) {
        self.array = array
    }
    
    func khoiTao(array: [Int]) {
        //Khoi tao
        var array: [Int]
        // print(array)
    }
    
    func inMang(array: [Int]) {
        var array: [Int]
        print("Mang dc in ra:")
    }
    
    func inMax(array: [Int]) -> Int {
        var max = array[0]
        for index in 0..<array.count {
            if array[index] > max {
                max = array[index]
            }
            
        }
        print("Gia tri lon nhat trong mang : \(max)")
        return max
    }
    
    func inMin(array: [Int]) -> Int {
        var min = array[0]
        for index in 0..<array.count {
            if array[index] < min {
                min = array[index]
            }
        }
        print("Gia tri nho nhat trong mang: \(min)")
        return min
    }
}
let ar = Mang1c(array: [1,2,3])
ar.inMax(array: [1,2,3])
ar.inMin(array: [2,1,4,6,0])

