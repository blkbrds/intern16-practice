import UIKit
import Foundation

let a:Float = 1, b:Float = 4, c:Float = 3

var x1:Float = 0, x2:Float = 0
if a==0 {
    if b==0 {
        if c==0 {
            print("Phuong trinh co nghiem voi moi x.")
        }
        else {
            print("Phuong trinh vo nghiem.")
        }
    }
    else {
        x1 = Float((-c)/b)
    }
}
else {
    let delta:Float = b*b-4*a*c
    if delta<0 {
        print("Phuong trinh vo nghiem.")
    }
    else if delta==0 {
        x1 = Float((-b)/(2*a))
        print("Phuong trinh co nghiem kep x = \(x1)")
    }
    else {
        let sq: Float = sqrtf(delta)
        x1 = (-b+sq)/(2*a)
        x2 = (-b-sq)/(2*a)
        print("Phuong trinh co hai nghiem x1 = \(x1) va x2 = \(x2)")
    }
}
