//
//  Bai01CollectionViewCell.swift
//  CollectionView
//
//  Created by bu on 8/5/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai01CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLabel(name: String) {
        nameLabel.textColor = .white
        nameLabel.text = name
    }

}
