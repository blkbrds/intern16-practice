//
//  Bai03CollectionViewCell.swift
//  CollectionView
//
//  Created by bu on 8/6/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai03CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLabel(image: String) {
        imageLabel.text = image
    }
}
