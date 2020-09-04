//
//  Comments.swift
//  MVVM
//
//  Created by bu on 8/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

final class Comment {
    
    var id: Int
    var imageName: String
    var name: String
    var comment: String
    
    init(id: Int = 0, imageName: String, name: String = "", comment: String = "") {
        self.id = id
        self.imageName = imageName
        self.name = name
        self.comment = comment
    }
}
