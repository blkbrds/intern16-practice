//
//  Baitap1.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/13/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import Foundation

protocol DongVat {
    func ten() -> String
}

protocol Thu: DongVat {
    var isDi: Bool { get set}
}

protocol Chim: DongVat {
    var isBay: Bool { get set }
}

protocol Ca: DongVat {
    var isBoi: Bool { get set }
}

class CaChuon: Ca, Chim {
    var isBoi: Bool = true
    var isBay: Bool = true

    func ten() -> String {
        return "Cá Chuồn"
    }
}

final class Bo: Thu {
    var isDi: Bool = true

    func ten() -> String {
        return "Bò"
    }
}

final class Ga: Chim {
    var isBay: Bool = true

    func ten() -> String {
        return "Gà"
    }
}

final class Vit: Chim, Ca, Thu {
    var isBay: Bool = true
    var isBoi: Bool = true
    var isDi: Bool = true

    func ten() -> String {
        return "Vịt"
    }
}

final class CaMap: Ca {
    var isBoi: Bool = true

    func ten() -> String {
        return "Cá Mập"
    }
}

final class Heo: Thu {
    var isDi: Bool = true

    func ten() -> String {
        return "Heo"
    }
}

final class HaiCau: Ca, Thu {
    var isBoi: Bool = true
    var isDi: Bool = true

    func ten() -> String {
        return "Hải Cẩu"
    }
}

final class Doi: Chim, Thu {
    var isBay: Bool = true
    var isDi: Bool = true

    func ten() -> String {
        return "Dơi"
    }
}

final class CaSau: Ca, Thu {
    var isBoi: Bool = true
    var isDi: Bool = true

    func ten() -> String {
        return "Cá Sấu"
    }
}

let animalGroup: [DongVat] = [CaChuon(), Bo(), Ga(), Vit(), CaMap(), Heo(), HaiCau(), Doi(), CaSau()]

enum ListAnimal {
    case bietBay
    case bietBoi
    case bietDi
    case bietBayVaBoi
    case bietDiVaBay
    case bietBoiVaDi
    case bietCa3
    case biet1Trong3

    func listAnimal() -> [String] {
        var bietBay: [String] = []
        var bietBoi: [String] = []
        var bietDi: [String] = []
        var bietBayVaBoi: [String] = []
        var bietDiVaBay: [String] = []
        var bietBoiVaDi: [String] = []
        var bietCa3: [String] = []
        var biet1Trong3: [String] = []

        switch self {
        case .bietBay:
            for animal in animalGroup {
                if animal is Chim {
                    bietBay.append(animal.ten())
                }
            }
            return bietBay
        case .bietBoi:
            for animal in animalGroup {
                if animal is Ca {
                    bietBoi.append(animal.ten())
                }
            }
            return bietBoi
        case .bietDi:
            for animal in animalGroup {
                if animal is Thu {
                    bietDi.append(animal.ten())
                }
            }
            return bietDi
        case .bietBayVaBoi:
            for animal in animalGroup {
                if animal is Ca && animal is Chim {
                    bietBayVaBoi.append(animal.ten())
                }
            }
            return bietBayVaBoi
        case .bietDiVaBay:
            for animal in animalGroup {
                if animal is Thu && animal is Chim {
                    bietDiVaBay.append(animal.ten())
                }
            }
            return bietDiVaBay
        case .bietBoiVaDi:
            for animal in animalGroup {
                if animal is Thu && animal is Ca {
                    bietBoiVaDi.append(animal.ten())
                }
            }
            return bietBoiVaDi
        case .bietCa3:
            for animal in animalGroup {
                if animal is Thu && animal is Ca && animal is Chim {
                    bietCa3.append(animal.ten())
                }
            }
            return bietCa3
        case .biet1Trong3:
            for animal in animalGroup {
                if animal is Thu || animal is Ca || animal is Chim {
                    biet1Trong3.append(animal.ten())
                }
            }
            return biet1Trong3
        }
    }
}
print(ListAnimal.bietBoiVaDi.listAnimal())

