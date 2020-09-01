//
//  CommentTableViewCellViewModel.swift
//  baitap14
//
//  Created by NXH on 8/23/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

final class CommentTableViewCellViewModel {
    
    private(set) var content: String
    private(set) var image: String = "icons8-profile-select-50"
    
    init(content: String) {
        self.content = content
    }
}
