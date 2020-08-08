//
//  Bai3CollectionViewCell.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/5/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai3CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private  weak var flowerImage: UIImageView!
    
    // MARK: - Public methods
    func updateCell(with image: UIImage) {
        flowerImage.image = image
    }
}

