//
//  User.swift
//  CollectionView
//
//  Created by Abcd on 8/3/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
final class User {
    var name: String
    init(name: String) {
        self.name = name
    }
}

extension User {
    static func getDummyDatas() -> [User] {
        var users: [User] = []
        
        for i in 0...50 {
            let user = User(name: "\(i)")
            users.append(user)
        }
        return users
    }
}
