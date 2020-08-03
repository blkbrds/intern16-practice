//
//  Bai4Model.swift
//  Bai1TableView
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
final class Bai4Model {
    
      //MARK: - Properties
    var animals: [[String]] = []
    
      //MARK: - Function
    func getData(){
        guard let path = Bundle.main.url(forResource: "Bai4Data", withExtension: "plist") else { return}
        guard let data = NSArray(contentsOf: path) else { return }
        animals  = data as! [[String]]
    }
    
    func numberOfSection() -> Int {
        return animals.count
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return animals[section].count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> String {
        let cell = animals[indexPath.section][indexPath.row]
        return cell
    }
}
