import UIKit

func calculateEquations(a1: Int, b1: Int, c1: Int, a2: Int, b2: Int, c2: Int) -> Float {
    let d: Int = a1 * b2 - a2 * b1
    let dx: Int = c1 * b2 - c2 * b1
    let dy: Int = a1 * c2 - a2 * c1
    if d == 0 && dx + dy == 0 {
        print("He phuong trinh co vo so nghiem")
    } else if d == 0 { print("He phuong trinh vo nghiem") }
    else {
        print("He phuong trinh co nghiem x, y = ", dx / d,",", dy / d)
    }
    return 0;
}
calculateEquations(a1: 1, b1: 2, c1: 3, a2: 4, b2: 5, c2: 6)
