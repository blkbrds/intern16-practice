//
//  Datas.swift
//  Collection View
//
//  Created by Phan Ngọc Khánh on 8/10/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import Foundation

final class Model {
    var index: String
    init(index: String) {
        self.index = index
    }
}

extension Model {
    static func getDummyDatas() -> [Model] {
        var data: [Model] = []
        for i in 1...100 {
            let datas = Model(index: "\(i)")
            data.append(datas)
        }
        return data
    }
}
