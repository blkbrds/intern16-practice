//
//  Information.swift
//  MVVM
//
//  Created by bu on 8/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

final class Information {
    
    // MARK: - Properties
    var id: Int
    var imageNames: [String] = []
    var introduction: String
    var comments: [Comment] = []
    
    // MARK: - Initialization
    init(id: Int, imageNames: [String], introduction: String, comments: [Comment]) {
        self.id = id
        self.imageNames = imageNames
        self.introduction = introduction
        self.comments = comments
    }
    
}
