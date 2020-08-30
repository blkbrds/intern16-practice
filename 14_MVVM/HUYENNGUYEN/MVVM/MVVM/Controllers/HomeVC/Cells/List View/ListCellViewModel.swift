//
//  ListViewModel.swift
//  MVVM
//
//  Created by bu on 8/26/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class ListCellViewModel {
    
    var datas: DataManager
    
    init(datas: DataManager) {
        self.datas = datas
    }
    
    func getFavoriteImage(isFavorite: Bool) -> UIImage? {
        let image: UIImage? = isFavorite ? #imageLiteral(resourceName: "ic-favorite") : #imageLiteral(resourceName: "ic-favorite-selected ")
        return image
    }
}
