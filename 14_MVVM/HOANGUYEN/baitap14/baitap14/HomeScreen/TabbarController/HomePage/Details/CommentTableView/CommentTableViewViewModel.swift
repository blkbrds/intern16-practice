//
//  CommentTableViewViewModel.swift
//  baitap14
//
//  Created by NXH on 8/23/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

final class CommentTableViewViewModel {
    var index: Int
    var cellViewModel: CommentTableViewCellViewModel?
    
    init(index: Int, cellViewModel: CommentTableViewCellViewModel) {
        self.index = index
        self.cellViewModel = cellViewModel
    }
}

