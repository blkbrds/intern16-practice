import UIKit

func tongBinhPhuong(n: Int) -> (Int) {
    var rem = n
    var tong = 0
    var temp = 0
    //sodautien vao
    while rem > 0 {
        //lay so cuoi
        temp = rem % 10
        //congtonglen
        tong += (temp * temp)
        rem = rem / 10
    }
    return tong
}
func ktSoHP(n: Int) -> (Int) {
    var rem = n
    var kq: Int = 0
    while(rem != 1 && rem != 4) {
        rem = tongBinhPhuong(n: rem);
    }
    //tong binh phuong bang 1 la so hanh phuc
    if(rem == 1) {
        kq = 1
    }
    //tong binh phuong bang 4 la so khong hanh phuc
        else if(rem == 4) {
            kq = 0
    }
    return kq
}

for index in 1...1000 {
    if ktSoHP(n: index) == 1 {
        print(index)
    }
}
