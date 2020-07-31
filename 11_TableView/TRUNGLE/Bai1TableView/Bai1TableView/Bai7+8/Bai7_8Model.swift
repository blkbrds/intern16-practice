//
//  Bai7_8Model.swift
//  Bai1TableView
//
//  Created by Abcd on 7/29/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
final class Bai7_8Model {
    var datas: [[String]] = []
    
    func getData() {
        guard let path = Bundle.main.url(forResource: "Data7", withExtension: "plist") else {return}
        guard let data = NSArray(contentsOf: path) else { return }
        datas = data as!  [[String]]
    }
    
    func numberOfSection() -> Int {
        return datas.count
    }
    
    func numberOfRowInSection(in section: Int) -> Int {
        return datas[section].count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> String {
        let item = datas[indexPath.section][indexPath.row]
        return item
    }
}
