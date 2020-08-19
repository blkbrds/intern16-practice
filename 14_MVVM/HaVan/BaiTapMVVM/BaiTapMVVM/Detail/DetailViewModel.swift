//
//  DetailViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/17/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import MapKit

enum SectionType {
    case description
    case mapView
    case comment
}

final class DetailViewModel {
    
    // MARK: - Properties
    private(set) var nameCoffee: String
    private(set) var address: String
    private(set) var description: String
    private(set) var location: CLLocationCoordinate2D
    private(set) var favorite: Bool
    private(set) var position: Int
    private(set) var comment: [String: String]
    private(set) var imageList: [UIImage]
    
    // MARK: - Initialize
    init(nameCoffee: String, address: String, description: String, location: CLLocationCoordinate2D, favorite: Bool, position: Int, comment: [String : String], imageList: [UIImage]) {
        self.nameCoffee = nameCoffee
        self.address = address
        self.description = description
        self.location = location
        self.favorite = favorite
        self.position = position
        self.comment = comment
        self.imageList = imageList
    }
    
    // MARK: - Public functions
    func chaneState(fav: Bool){
        HomeViewModel.shared.listCoffee[position].favorite = fav
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
    
    func numberOfRowInSection(section: Int) -> Int {
        if section == 0 || section == 1 {
            return 1
        }
        return comment.values.count
    }
    
    func numberOfSection() -> Int {
        return 3
    }
    
    func getImageCell(atIndexPath indexPath: IndexPath) -> SlideCellViewModel? {
        return SlideCellViewModel(image: imageList[indexPath.row])
    }
    
    func getMapViewCell(atIndexPath indexPath: IndexPath) -> MapCellViewModel? {
        return MapCellViewModel(location: location, name: nameCoffee, address: address)
    }
    
    func getDescriptionCell(atIndexPath indexPath: IndexPath) -> DescriptionCellViewModel? {
        return DescriptionCellViewModel(description: description)
    }
    
    func numberOfItemsInSection() -> Int {
        return imageList.count
    }
    
    func chooseSectionType(section: Int) -> SectionType {
        switch section {
        case 0:
            return .description
        case 1:
            return .mapView
        case 2:
            return .comment
        default:
            return .comment
        }
    }
}
