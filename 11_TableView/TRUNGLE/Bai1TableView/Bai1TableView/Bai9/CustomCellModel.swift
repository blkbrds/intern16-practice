//
//  CustomeCellModel.swift
//  Bai1TableView
//
//  Created by Abcd on 7/30/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation

final class CustomCellModel {
    
      //MARK: - Properties
    var user: User = User()
    
      //MARK: - Init
    init(user: User  = User()) {
        self.user = user
    }
}
