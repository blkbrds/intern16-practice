import Foundation

func tongBinhPhuong(n: Int) -> Int {
    var rem: Int = n
    var tong: Int = 0
    var temp: Int = 0
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

func ktSoHP(n: Int) -> Int {
    var rem: Int = n
    var ketqua: Int = 0
    while(rem != 1 && rem != 4) {
        rem = tongBinhPhuong(n: rem)
    }
    //tong binh phuong bang 1 la so hanh phuc
    if rem == 1 {
        ketqua = 1
    } else if rem == 4 {
        ketqua = 0
    }
    return ketqua
}

for index in 1...1000 {
    if ktSoHP(n: index) == 1 {
        print(index)
    }
}
