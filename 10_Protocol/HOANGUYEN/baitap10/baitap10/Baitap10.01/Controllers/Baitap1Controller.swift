//
//  Baitap1Controller.swift
//  baitap10
//
//  Created by NXH on 7/20/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation
import UIKit

final class Baitap1Controller: UIViewController {
    
    let listDongVat: [DongVat] = [CaChuon(), Bo(), Ga(), Vit(), CaMap(), Heo(), HaiCau(), Doi(), CaSau()]
    
    // MARK: Initialize
    override func viewDidLoad() {
        super.viewDidLoad()
        print(biet1Trong3())
    }
    
    // MARK: - Private Function
    private func bietBoi() -> [DongVat] {
        var listBietBoi: [DongVat] = []
        for index in 0..<listDongVat.count {
            if listDongVat[index].isBoi {
                listBietBoi.append(listDongVat[index])
            }
        }
        return listBietBoi
    }
    
    private func bietBay() -> [DongVat] {
        var listBietBay: [DongVat] = []
        for index in 0..<listDongVat.count {
            if listDongVat[index].isBay {
                listBietBay.append(listDongVat[index])
            }
        }
        return listBietBay
    }
    
    private func bietDi() -> [DongVat] {
        var listBietDi: [DongVat] = []
        for index in 0..<listDongVat.count {
            if listDongVat[index].isDi {
                listBietDi.append(listDongVat[index])
            }
        }
        return listBietDi
    }
    
    private func bietBayBoi() -> [DongVat] {
        var listBietBayBoi: [DongVat] = []
        for index in 0..<listDongVat.count {
            if listDongVat[index].isDi && listDongVat[index].isBoi {
                listBietBayBoi.append(listDongVat[index])
            }
        }
        return listBietBayBoi
    }
    
    private func bietDiBay() -> [DongVat] {
        var listBietDiBay: [DongVat] = []
        for index in 0..<listDongVat.count {
            if listDongVat[index].isDi && listDongVat[index].isBay {
                listBietDiBay.append(listDongVat[index])
            }
        }
        return listBietDiBay
    }
    
    private func bietBoiDi() -> [DongVat] {
        var listBietBoiDi: [DongVat] = []
        for index in 0..<listDongVat.count {
            if listDongVat[index].isDi && listDongVat[index].isBoi {
                listBietBoiDi.append(listDongVat[index])
            }
        }
        return listBietBoiDi
    }
    
    private func bietCa3() -> [DongVat] {
        var listBietCa3: [DongVat] = []
        for index in 0..<listDongVat.count {
            if listDongVat[index].isDi && listDongVat[index].isBoi && listDongVat[index].isBay {
                listBietCa3.append(listDongVat[index])
            }
        }
        return listBietCa3
    }
    
    private func biet1Trong3() -> [DongVat] {
        var listBiet1Trong3: [DongVat] = []
        for index in 0..<listDongVat.count {
            if listDongVat[index].isDi && !listDongVat[index].isBoi && !listDongVat[index].isBay || !listDongVat[index].isDi && listDongVat[index].isBoi && !listDongVat[index].isBay || !listDongVat[index].isDi && !listDongVat[index].isBoi && listDongVat[index].isBay {
                listBiet1Trong3.append(listDongVat[index])
            }
        }
        return listBiet1Trong3
    }
}
