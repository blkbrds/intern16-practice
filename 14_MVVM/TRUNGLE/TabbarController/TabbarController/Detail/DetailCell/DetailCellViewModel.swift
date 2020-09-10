//
//  DetailCellViewModel.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
final class DetailCellViewModel {
    
    //MARK: - Properties
    var commentManager: CommentManager = CommentManager()
    
    //MARK: - Init
    init(commentManager: CommentManager = CommentManager()) {
        self.commentManager = commentManager
    }
}
