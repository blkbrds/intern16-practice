//
//  CommentViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/18/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

final class CommentViewModel {
    private(set) var comment: [String: String]
    
    init(comment: [String: String]) {
        self.comment = comment
    }
    
    func getCommentViewCell(atIndexPath indexPath: IndexPath) -> CommentCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row <= comment.count else { return nil }
        let key = Array(comment.keys)
        guard let value = comment[key[indexPath.row]] else { return nil }
        let dateNumber = Int.random(in: 1...7)
        var dateString = String()
        switch dateNumber {
        case 1:
            dateString = "Sunday"
        case 2:
            dateString = "Monday"
        case 3:
            dateString = "Tuesday"
        case 4:
            dateString = "Wednesday"
        case 5:
            dateString = "Thursday"
        case 6:
            dateString = "Friday"
        case 7:
            dateString = "Saturday"
        default:
            dateString = "Noday"
        }
        return CommentCellViewModel(name: key[indexPath.row], comment: value, date: dateString)
    }
    
    func numberOfRowInSection() -> Int {
        return comment.values.count
    }
}

extension HomeViewModel {
    
    func getComment(atIndexPath indexPath: IndexPath) -> CommentViewModel? {
        guard 0 <= indexPath.row && indexPath.row <= HomeViewModel.shared.listCoffee.count else { return nil }
        return CommentViewModel(comment: HomeViewModel.shared.listCoffee[indexPath.row].comment)
    }
}
