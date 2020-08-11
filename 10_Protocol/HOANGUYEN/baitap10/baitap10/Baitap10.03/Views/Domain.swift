
import Foundation
struct Domain {
    
//    enum domainEnum {
//        case bac
//        case trung
//        case nam
//    }
    
    var domain: String
    var province: [Province] = []
    
    init(domain: String) {
        
        switch domain {
        case "Bắc":
            self.domain = "Bắc"
            province.append(Province(province: "Hà Nội"))
            province.append(Province(province: "Hải Phòng"))
        case "Trung":
            self.domain = "Trung"
            province.append(Province(province: "Quảng Bình"))
            province.append(Province(province: "Đà Nẵng"))
            province.append(Province(province: "Huế"))
        default:
            self.domain = "Nam"
            province.append(Province(province: "TP.HCM"))
        }
    }
}
