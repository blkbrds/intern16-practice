//
//  DetailModel.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/17/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class DetailModel {
    
    // MARK: - Properties
    var name: String
    var comment: String
    var time: String
    
    // MARK: - Initial
    init(name: String = "", comment: String = "", time: String = "") {
        self.name = name
        self.comment = comment
        self.time = time
    }
}
