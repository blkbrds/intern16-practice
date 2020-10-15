//
//  Data.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/14/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import Foundation

class ConfigData {
    var mienArray: [String] = ["Miền 1", "Miền 2", "Miền 3", "Miền 4", "Miền 5", "Miền 6", "Miền 7", "Miền 8", "Miền 9", "Miền 10"]
    var tinhArray: [String] = ["Tỉnh 1", "Tỉnh 2", "Tỉnh 3", "Tỉnh 4", "Tỉnh 5", "Tỉnh 6", "Tỉnh 7", "Tỉnh 8", "Tỉnh 9", "Tỉnh 10"]
    var huyenArray: [String] = ["Huyện 1", "Huyện 2", "Huyện 3", "Huyện 4", "Huyện 5", "Huyện 6", "Huyện 7", "Huyện 8", "Huyện 9", "Huyện 10"]

    func getMien(tag: Int) -> String {
        return mienArray[tag - 1]
    }

    func getTinh(tag: Int) -> String {
        return tinhArray[tag - 1]
    }

    func getHuyen(tag: Int) -> String {
        return huyenArray[tag - 1]
    }
}


