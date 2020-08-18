//
//  Colors.swift
//  Collection View
//
//  Created by Ngoc Khanh Phan on 8/18/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    var objectsArray = [
        TableViewCellModel(
            subcategory: ["SubCategory #1.1", "SubCategory #1.2"],
            colors: [
                // SubCategory #1.1
                [CollectionViewCellModel(color: UIColor.red),
                 CollectionViewCellModel(color: UIColor.systemTeal),
                 CollectionViewCellModel(color: UIColor.green),
                 CollectionViewCellModel(color: UIColor.purple),
                 CollectionViewCellModel(color: UIColor.systemOrange)],
                // SubCategory #1.2
                [CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange)]
            ]),
        TableViewCellModel(
            subcategory: ["SubCategory #2.1"],
            colors: [
                // SubCategory #2.1
                [CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange)]
            ]),
        TableViewCellModel(
            subcategory: ["SubCategory #3.1", "SubCategory #3.2"],
            colors: [
                // SubCategory #3.1
                [CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange)],
                // SubCategory #3.2
                [CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange)]
            ]),
        TableViewCellModel(
            subcategory: ["SubCategory #4.1", "SubCategory #4.2"],
            colors: [
                // SubCategory #4.1
                [CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange)],
                // SubCategory #4.2
                [CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange)]
            ]),
        TableViewCellModel(
            subcategory: ["SubCategory #5.1", "SubCategory #5.2"],
            colors: [
                // SubCategory #5.1
                [CollectionViewCellModel(color: UIColor.systemOrange)],
                // SubCategory #5.2
                [CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange),
                 CollectionViewCellModel(color: UIColor.systemOrange)]
            ])
    ]
}
