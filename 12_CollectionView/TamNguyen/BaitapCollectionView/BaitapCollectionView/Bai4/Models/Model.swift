//
//  Model.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class Model {
    
    // MARK: - Properties
    let text: String
    let imageName: String
    
    // MARK: - Initial
    init(text: String = "", imageName: String = "") {
        self.text = text
        self.imageName = imageName
    }
}
