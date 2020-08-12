//
//  ImageCell.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/5/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class ImageCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Public functions
    func configImageCell(image: UIImage) {
        imageView.image = image
    }
}
