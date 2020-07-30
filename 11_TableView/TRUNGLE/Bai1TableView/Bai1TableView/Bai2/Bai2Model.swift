//
//  Bai2Model.swift
//  Bai1TableView
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai2Model {
    var dataArray : [String] = []
    
    func getData(){
        guard let path = Bundle.main.url(forResource: "Data", withExtension: "plist")
            else { return }
        guard let data = NSArray(contentsOf: path) else {
            return
        }
        dataArray = data as! [String]
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return dataArray.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> String {
        let item = dataArray[indexPath.row]
        return item
    }
}
