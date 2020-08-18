//
//  CommentCellViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/18/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

final class CommentCellViewModel {
    private(set) var name: String
    private(set) var comment: String
    private(set) var date: String
    
    init(name: String, comment: String, date: String) {
        self.name = name
        self.comment = comment
        self.date = date
    }
}
