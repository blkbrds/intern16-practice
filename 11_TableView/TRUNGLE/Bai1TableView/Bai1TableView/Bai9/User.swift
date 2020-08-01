//
//  User.swift
//  Bai1TableView
//
//  Created by Abcd on 7/30/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation

final class User {
    var userName: String
    var imageView: String
    var subTitle: String
    
    init(userName: String = "", imageView: String = "", subTitle: String = "") {
        self.userName = userName
        self.imageView = imageView
        self.subTitle = subTitle
    }
}
