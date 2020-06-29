import UIKit
import Foundation
class Pitago {
    var canh = [(Int , Int, Int)]()
    
    init(canh :[(Int, Int, Int)]) {
        self.canh = canh
    }
    
    func isPitago(cacCanh : (Int , Int , Int)) -> Bool{
        
        if  cacCanh.0 * cacCanh.0 + cacCanh.1 * cacCanh.1 == cacCanh.2 * cacCanh.2 ||
            cacCanh.1 * cacCanh.1 + cacCanh.2 * cacCanh.2 == cacCanh.0 * cacCanh.0 ||
            cacCanh.0 * cacCanh.0 + cacCanh.2 * cacCanh.2 == cacCanh.1 * cacCanh.1{
            return true
        }
        return false
    }
    
    func piTago(){
        var i = 0
        while i < canh.count{
            if isPitago(cacCanh: canh[i]){
                print(canh[i])
            }
            i += 1
        }
    }
}

var tgV = Pitago(canh: [(3,4,5),(2,3,4)])
tgV.piTago()
