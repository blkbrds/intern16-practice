//
//  DetailCellViewModel.swift
//  MVVM
//
//  Created by bu on 8/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

final class CommentTableViewCellViewModel {
    
    // MARK: - Properties
    var comments: Comment
    var imageName: String {
        return comments.imageName
    }
    var name: String {
        return comments.name
    }
    var comment: String {
        return comments.comment
    }
    
    // MARK: - Initalization
    init(dataDetailCell: Comment) {
        self.comments = dataDetailCell
    }
}
