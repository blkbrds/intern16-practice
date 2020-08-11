//
//  Baitap1001.swift
//  baitap10
//
//  Created by NXH on 7/20/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

protocol DongVat {
    var isBoi: Bool {get}
    var isBay: Bool {get}
    var isDi: Bool {get}
    func ten() -> String
}

protocol Thu: DongVat {
    var isDi: Bool {get}
}

protocol Ca: DongVat {
    var isBoi: Bool {get}
}

protocol Chim: DongVat {
    var isBay: Bool {get}
}

final class CaChuon: Ca {
    var isBay: Bool = false
    
    var isDi: Bool = false
    
    var isBoi: Bool = true
    
    func ten() -> String {
        return "Ca Chuon"
    }
}

final class CaMap: Ca {
    var isBoi: Bool = true
    
    var isBay: Bool = false
    
    var isDi: Bool = false

    func ten() -> String {
        return "Ca Map"
    }
}

final class Bo: Thu {
    var isDi: Bool = true
    
    var isBay: Bool = false
    
    
    var isBoi: Bool = false
    
    func ten() -> String {
        return "Bo"
    }
}

final class Ga: Chim {
    var isDi: Bool = true
    
    var isBay: Bool = true
    
    var isBoi: Bool = false
    
    func ten() -> String {
        return "Ga"
    }
}

final class Vit: Chim, Ca, Thu {
    var isBay: Bool = true
    
    var isBoi: Bool = true
    
    var isDi: Bool = true
    
    func ten() -> String {
        return "Vit"
    }
}

final class Heo: Thu {
    var isDi: Bool = true
    
    var isBay: Bool = false
    
    var isBoi: Bool = false
    
    func ten() -> String {
        return "Heo"
    }
}

final class HaiCau: Thu, Ca {
   var isDi: Bool = true
   
   var isBay: Bool = false
   
   var isBoi: Bool = true
    
    func ten() -> String {
        return "Hai Cau"
    }
}

final class Doi: Thu, Chim {
    var isDi: Bool = false
    
    var isBay: Bool = true
    
    var isBoi: Bool = false
    
    func ten() -> String {
        return "Doi"
    }
}

final class CaSau: Thu, Ca {
    var isDi: Bool = true
    
    var isBay: Bool = false

    var isBoi: Bool = true
    
    func ten() -> String {
        return "Ca Sau"
    }
}
