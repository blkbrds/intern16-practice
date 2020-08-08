//
//  Bai4CollectionViewCell.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai4CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var flagImageView: UIImageView!
    
    // MARK: - Public methods
    func updateCollectonView(with model: Model) {
        titleLabel.text = model.text
        flagImageView.image = UIImage(named: model.imageName)
    }
}
