//
//  Sections.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/28/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

struct Sections {
    static var sections: [[String]] = [[]]
    
    static func loadData(){
        guard let path = Bundle.main.url(forResource: "Sections", withExtension: ".plist")
            else { return }
        guard let sectionData = NSArray(contentsOf: path) as? [[String]]
            else { return }
        sections = sectionData
    }
}
