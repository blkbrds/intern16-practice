//
//  HomeModel.swift
//  Bai1TableView
//
//  Created by Abcd on 7/30/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation

final class HomeModel {
    var users: [[User]] = []
    
    func numberOfSection() -> Int {
        return users.count
    }
    
    func numberOfRowInSection(in section: Int) -> Int {
        return users[section].count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> CustomCellModel {
        let item = users[indexPath.section][indexPath.row]
        let viewModel = CustomCellModel(user: item)
        return viewModel
    }
    
    func getData() {
        var users: [[User]] = []
        guard let path = Bundle.main.url(forResource: "Data9", withExtension: "plist") else {
            return         }
        guard let data = NSArray(contentsOf: path) as? [[String]] else {
            return
        }
        
        for i in 0 ..< data.count {
            var userNames = [User]()
            for j in 0 ..< data[i].count {
                let user = User(userName: data[i][j], imageView: "avatar", subTitle: "Sub title")
                userNames.append(user)
            }
            users.append(userNames)
        }
        self.users = users
    }
}
