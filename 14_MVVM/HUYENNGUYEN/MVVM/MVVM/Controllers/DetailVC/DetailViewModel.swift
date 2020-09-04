//
//  DetailViewModel.swift
//  MVVM
//
//  Created by bu on 8/27/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

final class DetailViewModel {
    
    // MARK: - Enum
    enum Section: Int, CaseIterable {
        case content = 0
        case map
        case comment
    }
    
    // MARK: - Properties
    var information: Information
    
    // MARK: - Initialization
    init(information: Information) {
        self.information = information
    }
    
    // MARK: - Function
    func numberOfSections() -> Int {
        return Section.allCases.count
    }
    
    func numberOfItemsForCollection(inSection section: Int) -> Int {
        return information.imageNames.count
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        guard let type = DetailViewModel.Section(rawValue: section) else { return 0 }
        switch type {
        case .comment:
            return information.comments.count
        default:
            return 1
        }
    }
    
    func cellForItem(at indexPath: IndexPath) -> Any? {
        guard let type = DetailViewModel.Section(rawValue: indexPath.section) else { return nil }
        switch type {
        case .content:
            return ContentTableViewCellViewModel(content: information.introduction)
        case .map:
            return nil
        case .comment:
            guard information.comments.count > indexPath.row else { return nil }
            let comment = information.comments[indexPath.row]
            return CommentTableViewCellViewModel(dataDetailCell: comment)
        }
    }
}
