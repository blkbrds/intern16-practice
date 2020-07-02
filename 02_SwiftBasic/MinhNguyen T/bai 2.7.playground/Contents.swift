import Foundation

// Thay đổi gia trị cũ trong mãng thành giá trị mơi
func changeMang(mang: [Int], giaTriCu: Int, giaTriMoi: Int)-> [Int] {
    var bienTam = mang
    for i in 0..<bienTam.count where bienTam[i] == giaTriCu {
        bienTam[i] = giaTriMoi
    }
    return bienTam
}

changeMang(mang: [1,3,1], giaTriCu: 1, giaTriMoi: 2)
