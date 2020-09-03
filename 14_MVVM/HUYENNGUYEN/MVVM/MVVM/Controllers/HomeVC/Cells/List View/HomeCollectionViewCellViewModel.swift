//
//  ListViewModel.swift
//  MVVM
//
//  Created by bu on 8/26/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class HomeCollectionViewCellViewModel {
    
    // MARK: - Properties
    var data: DataManager
    var imageName: String {
        return data.image
    }
    var name: String {
        return data.title
    }
    var address: String {
        return data.address
    }
    var rate: String {
        return data.rate
    }
    var distance: Int {
        return data.distance
    }
    var isFavorite: Bool {
        return data.isFavorite
    }
    var image: UIImage? {
        return data.isFavorite ? #imageLiteral(resourceName: "ic-favorite"): #imageLiteral(resourceName: "ic-favorite-selected ")
    }
    
    // MARK: - Initialization
    init(data: DataManager) {
        self.data = data
    }
}
