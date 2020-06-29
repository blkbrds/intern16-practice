import UIKit
import Foundation

class DaGiac {
    var soCanh:Int = 0
    var arrCanh:Array<Int> = []
    
    enum check {
        case khongbang
        case bang(Int,[Int])
    }
    func checkDaGiac(canh: Int, arr: [Int]) -> check {
        if canh == arr.count {
            return .bang(canh, arr)
        }
            return .khongbang
    }
    
    init(sc:Int, arrC:Array<Int>) {
        let ck = checkDaGiac(canh: sc, arr: arrC)
        switch ck {
        case .khongbang:
            print("Nhập số cạnh va array cạnh không bằng nhau")
            self.arrCanh = []
            self.soCanh = sc
        case .bang(let scanh, let arr):
            self.arrCanh = arr
            self.soCanh = scanh
        }
    }
        
    func chuVi() -> Int {
        var cv:Int = 0
        for i in self.arrCanh  {
            cv = cv + i
        }
        return cv
    }
    
    func inCacCanh() {
        for i in self.arrCanh {
            print(i)
        }
    }
}


class TamGiac : DaGiac {
        
     init(arrcanh: Array<Int>) {
        super.init(sc: 3, arrC: arrcanh)
        if super.arrCanh.count == 0 {
            return
        }
        else if (super.arrCanh[0] + super.arrCanh[1] < super.arrCanh[2] || super.arrCanh[1] + super.arrCanh[2] < super.arrCanh[0]) ||   super.arrCanh[0] + super.arrCanh[2] < super.arrCanh[1] {
            print("3 Cạnh nhập vào không phải là tam giác")
            self.arrCanh = []
        }
    }
    
    override func chuVi() -> Int {
        if arrCanh.count == 0 {
            return 0
        }
        else {
            var S:Int = 0
            for i in arrCanh {
                S += i
            }
        return S
        }
    }
    func dienTich() -> Float {
        if arrCanh.count == 0 {
            return 0
        }
        else {
            let p:Float = Float(chuVi() / 2)
            var S = p
            for i in arrCanh {
                 S = S * (p - Float(i))
            }
             return S
        }
    }
}


let dg:DaGiac = DaGiac(sc: 4, arrC: [1,7,2])
dg.chuVi()
dg.inCacCanh()
dg.chuVi()

let tg:TamGiac = TamGiac(arrcanh: [-2,4,5])
tg.chuVi()
tg.dienTich()
tg.inCacCanh()
