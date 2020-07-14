import Foundation

func GPTB1 (a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) {
    let D: Float = a1 * b2 - a2 * b1
    let Dx: Float = c1 * b2 - c2 * b1
    let Dy: Float = a1 * c2 - a2 * c1
    
    if D == 0 {
        if Dx + Dy == 0 {
            print("He phuong trinh co vo so nghiem") }
        else {
            print("He phuong trinh vo ngiem") }
    } else {
        let x: Float = Dx / D
        let y: Float = Dy / D
        print("He phuong trinh co nghiem(x, y) = (\(x),\(y))")
    }
}

GPTB1(a1: 2, b1: 1, c1: 4, a2: 3, b2: 2, c2: 7)
