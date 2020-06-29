import UIKit

class HocSinh {
    var hoTen: String
    var namSinh: Int
    var diem: Float
    
    init(hoTen: String, namSinh: Int, diem: Float) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.diem = diem
    }
    
    
}
class DSHocSinh {
    var dSHocSinh = [HocSinh]()
    
    init(dSHocSinh: [HocSinh])  {
        self.dSHocSinh = dSHocSinh
    }
    
    func sapXep() {
        var temp : HocSinh
        for i in 0..<dSHocSinh.count-1 {
            for j in i+1..<dSHocSinh.count {
                if(dSHocSinh[i].diem < dSHocSinh[j].diem){
                    temp = dSHocSinh[i]
                    dSHocSinh[i] = dSHocSinh[j]
                    dSHocSinh[j] = temp
                    
                }
                else if (dSHocSinh[i].diem == dSHocSinh[j].diem){
                    if(dSHocSinh[i].namSinh < dSHocSinh[j].namSinh){
                    temp = dSHocSinh[i]
                    dSHocSinh[i] = dSHocSinh[j]
                    dSHocSinh[j] = temp
                }
            }
        }
    }
}
    func inDS(){
        for i in 0..<dSHocSinh.count{
            print("Ten la: \(dSHocSinh[i].hoTen),Nam sinh: \(dSHocSinh[i].namSinh), Diem: \(dSHocSinh[i].diem)")
        }
    }
}
let hS1 = HocSinh(hoTen: "a", namSinh: 1998, diem: 7.5)
let hS2 = HocSinh(hoTen: "b", namSinh: 1999, diem: 7.5)
let ds = DSHocSinh(dSHocSinh: [hS1,hS2])
ds.inDS()
ds.sapXep()
ds.inDS()



