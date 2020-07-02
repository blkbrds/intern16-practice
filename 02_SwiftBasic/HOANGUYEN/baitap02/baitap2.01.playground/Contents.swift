import Foundation

func calCircle (_ r: Float) -> (dienTich: Float, theTich: Float) {
//    Tinh dien tich
    let dienTich: Float = Float.pi * powf(r, 2) * 4
//    Tinh the tich
    let theTich: Float = Float.pi * powf(r, 3) * 4 / 3
    return (dienTich, theTich)
}

calCircle(2.3)
