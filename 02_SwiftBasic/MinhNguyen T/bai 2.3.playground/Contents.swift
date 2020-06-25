import UIKit


// Giai hpt 2 án
func hpt(a1:Int, a2: Int, b1:Int, b2:Int, c1:Int, c2:Int){
    let D = a1 * b2 - a2 * b1;
    let Dx = c1 * b2 - c2 * b1;
    let Dy = a1 * c2 - a2 * c1;
    if (D == 0) {
        if (Dx + Dy == 0){
            print("He phuong trinh co vo so nghiem")
        }
        else{
            print("He phuong trinh vo nghiem")
        }
    }
    else {
        let x = Dx / D;
        let y = Dy / D;
        print("He phuong trinh co nghiem (x, y) \(x), \(y)")
    }
}
