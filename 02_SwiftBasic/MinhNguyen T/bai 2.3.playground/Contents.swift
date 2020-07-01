import Foundation

// Giai hpt 2 án
func hpt(a1: Int, a2: Int, b1: Int, b2: Int, c1: Int, c2: Int) -> String {
    let D: Int = a1 * b2 - a2 * b1
    let Dx: Int = c1 * b2 - c2 * b1
    let Dy: Int = a1 * c2 - a2 * c1
    if D == 0 {
        if Dx + Dy == 0 {
            return "He phuong trinh co vo so nghiem"
        } else {
            return "He phuong trinh vo nghiem"
        }
    } else {
        let x = Dx / D
        let y = Dy / D
        return "He phuong trinh co nghiem (x, y) \(x), \(y)"
    }
}

hpt(a1: 1, a2: 2, b1: 3, b2: 4, c1: 5, c2: 6)
