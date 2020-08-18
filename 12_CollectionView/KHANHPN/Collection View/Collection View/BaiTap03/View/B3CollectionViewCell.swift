//
//  B3CollectionViewCell.swift
//  Collection View
//
//  Created by Phan Ngọc Khánh on 8/10/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class B3CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(avatar: UIImage) {
        imageView.image = avatar
    }
}
