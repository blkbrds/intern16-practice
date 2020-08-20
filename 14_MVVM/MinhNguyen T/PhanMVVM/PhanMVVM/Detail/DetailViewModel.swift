//
//  DetailViewModel.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class DetailViewModel {
    
    enum Section {
        case description
        case map
        case comment
    }
    
    // MARK: - Peroperties
    var data: Data?
    var description: String = ""
    var comment: [String] = []
    var sections: [Section] = [.description, .map, .comment]
    
    // MARK: - Initialize
    init(data: Data? = nil) {
        self.data = data
    }
    
    // MARK: - Public functions
    func numberOfSections() -> Int? {
        return sections.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        guard let mydata = data else { return 1}
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return mydata.comment.count
        }
    }
    
    func sectionType(section: Int) -> Section {
        switch section {
        case 0:
            return .description
        case 1:
            return .map
        case 2:
            return .comment
        default:
            return .comment
        }
    }
    
    func getMapView(indexPath: IndexPath) -> MapTableViewCell {
           return MapTableViewCell()
    }
    
    func getComment(indexPath: IndexPath) -> CommentViewModel? {
        guard let mydata = data else { return nil }
        return CommentViewModel(name: mydata.nameuser, comment: mydata.comment[indexPath.row], time: mydata.dayago)
    }
    
    func getDescription(indexPath: IndexPath) -> IntroductionViewModel? {
        guard let mydata = data else { return nil }
        return IntroductionViewModel(description: mydata.description)
    }
}
