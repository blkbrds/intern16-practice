//
//  CommentViewModel.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class CommentViewModel {
    
    // MARK: - Properties
    var name: String
    var comment: String
    var time: String
    
    // MARK: - Initial
    init(name: String = "", comment: String = "", time: String = "") {
        self.name = name
        self.comment = comment
        self.time = time
    }
}
