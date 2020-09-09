//
//  DataDetail.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
final class DataCellDetail {
    //MARK: - Properties
    var name: String
    var image: String
    var comment: String
    var time: String
    
    //MARK: - Init
    init(name: String = "", image: String = "", comment: String = "", time: String = "") {
        self.name = name
        self.image = image
        self.comment = comment
        self.time = time
    }
}
