//
//  Animal.swift
//  BaitapProtocol
//
//  Created by PCI0001 on 7/23/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

protocol Animal {
    func name() -> String
}

protocol Mammal: Animal {
    func name() -> String
    var isWalking: Bool { get }
}

protocol Bird: Animal {
    func name() -> String
    var isFlying: Bool { get }
}

protocol Fish: Animal {
    func name() -> String
    var isSwimming: Bool { get }
}

class CaChuon: Fish, Bird {
    
    var isSwimming: Bool {
        return true
    }
    
    var isFlying: Bool {
        return true
    }
    
    func name() -> String {
        return "Ca chuon"
    }
}

class Bo: Mammal {
    
    var isWalking: Bool {
        return true
    }
    
    func name() -> String {
        return "Con bo"
    }
}

class Ga: Bird {
    
    var isFlying: Bool {
        return true
    }
    
    func name() -> String {
        return "Con ga"
    }
}

class Vit: Bird, Mammal, Fish {
    
    var isFlying: Bool {
        return true
    }
    
    var isWalking: Bool {
        return true
    }
    
    var isSwimming: Bool {
        return true
    }
    
    func name() -> String {
        return "Con vit"
    }
}

class CaMap: Fish {
    
    var isSwimming: Bool {
        return true
    }
    
    func name() -> String {
        return "Con ca map"
    }
}

class Heo: Mammal {
    
    var isWalking: Bool {
        return true
    }
    
    func name() -> String {
        return "Con heo"
    }
}

class HaiCau: Fish, Mammal {
    
    var isSwimming: Bool {
        return true
    }
    
    var isWalking: Bool {
        return true
    }
    
    func name() -> String {
        return "Con hai cau"
    }
}

class Doi: Mammal, Fish {
    
    var isWalking: Bool {
        return true
    }
    
    var isSwimming: Bool {
        return true
    }
    
    func name() -> String {
        return "Con doi"
    }
}

class CaSau: Fish, Mammal {
    var isWalking: Bool {
        return true
    }
    
    var isSwimming: Bool {
        return true
    }
    
    func name() -> String {
        return "Con ca sau"
    }
}

// Khoi tao doi tuong
let cachuon = CaChuon()
let bo = Bo()
let ga = Ga()
let vit = Vit()
let camap = CaMap()
let heo = Heo()
let haicau = HaiCau()
let doi = Doi()
let casau = CaSau()
// Nhom tat ca ve mot array
let animals: [Animal] = [cachuon, bo, ga, vit, camap, heo, haicau, doi, casau]

enum Instintct {
    case canFly
    case canSwim
    case canWalk
    case bothFlySwim
    case bothWalkFly
    case bothSwimFly
    case bothSwimWalk
    case bothAll
    case onlyOne
    
    func getListAnimals() -> [Animal] {
        //Khai bao cac mang liet ke
        var canFlys: [Animal] = []
        var canSwims: [Animal] = []
        var canWalks: [Animal] = []
        var bothFlySwims: [Animal] = []
        var bothWalkFlys: [Animal] = []
        var bothSwimFlys: [Animal] = []
        var bothSwimWalks: [Animal] = []
        var bothAlls: [Animal] = []
        var onlyOnes: [Animal] = []
        switch self {
        case .canWalk :
            for index in animals {
                if let index = index as? Mammal, index.isWalking {
                    canWalks.append(index)
                }
            }
            return canWalks
        case .canFly :
            for index in animals {
                if let index = index as? Bird, index.isFlying {
                    canWalks.append(index)
                }
            }
            return canWalks
        case .canSwim:
            for index in animals {
                if let index = index as? Fish, index.isSwimming {
                    canSwims.append(index)
                }
            }
            return canSwims
        case .bothFlySwim:
            for index in animals {
                if let index = index as? Bird & Fish, index.isSwimming, index.isSwimming {
                    bothFlySwims.append(index)
                }
            }
            return bothFlySwims
        case .bothWalkFly:
            for index in animals {
                if let index = index as? Mammal & Bird, index.isFlying, index.isWalking {
                    bothWalkFlys.append(index)
                }
            }
            return bothWalkFlys
        case .bothSwimFly:
            for index in animals {
                if let index = index as? Fish & Bird, index.isFlying, index.isSwimming {
                    bothSwimFlys.append(index)
                }
            }
            return bothSwimFlys
        case .bothSwimWalk:
            for index in animals {
                if let index = index as? Fish & Mammal, index.isSwimming, index.isWalking {
                    bothSwimWalks.append(index)
                }
            }
            return bothSwimWalks
        case .bothAll:
            for index in animals {
                if let index = index as? Mammal & Bird & Fish, index.isSwimming, index.isWalking, index.isFlying {
                    index.isWalking {
                        bothAlls.append(index)
                    }
                }
                return bothAlls
                case .onlyOne:
                for index in animals {
                    if let index = index as? Mammal & Bird & Fish, index.isFlying || index.isSwimming || index.isWalking {
                        onlyOnes.append(index)
                    }
                }
                return onlyOnes
            }
        }
}
