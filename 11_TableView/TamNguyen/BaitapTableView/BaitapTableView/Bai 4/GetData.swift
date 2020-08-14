//
//  GetData.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/28/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class GetData {
    
    // MARK: - Properties
    var friends: [[String]] = []
    
    // MARK: - Function
    func loadData() {
        guard let path = Bundle.main.url(forResource: "Friends", withExtension: "plist") else { return }
        guard let data = NSArray(contentsOf: path) as? [[String]] else { return }
        friends = data 
    }
    
    func numberOfSections() -> Int {
        return friends.count
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return friends[section].count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> String {
        let item = friends[indexPath.section][indexPath.row]
        return item
    }
}
