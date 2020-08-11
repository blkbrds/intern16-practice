

struct Province {
    let province: String
    var districts: [District] = []
    
    init(province: String) {
        self.province = province
        
        switch province {
        case "Hà Nội":
            districts.append(District(dis: "HN1"))
            districts.append(District(dis: "HN2"))
            districts.append(District(dis: "HN3"))
            districts.append(District(dis: "HN4"))
            districts.append(District(dis: "HN5"))
        case "Hải Phòng":
            districts.append(District(dis: "HP Bay"))
            districts.append(District(dis: "HP Bơi"))
            districts.append(District(dis: "HP Múa"))
            districts.append(District(dis: "HP Lướt"))
            districts.append(District(dis: "HP Ngủ"))
        case "Đà Nẵng":
            districts.append(District(dis: "ĐN Tiger"))
            districts.append(District(dis: "ĐN Huda"))
            districts.append(District(dis: "ĐN Larue"))
            districts.append(District(dis: "ĐN Say"))
        case "Quảng Bình":
            districts.append(District(dis: "QB xập xình"))
            districts.append(District(dis: "QB 2"))
        case "Huế":
            districts.append(District(dis: "Huế 1"))
            districts.append(District(dis: "Huế 2 "))
            districts.append(District(dis: "Huế 3"))
        case "TP.HCM":
            districts.append(District(dis: "Sài Gòn 1"))
        districts.append(District(dis: "Sài Gòn 2 "))
        default:
            return
        }
        
    }
}
