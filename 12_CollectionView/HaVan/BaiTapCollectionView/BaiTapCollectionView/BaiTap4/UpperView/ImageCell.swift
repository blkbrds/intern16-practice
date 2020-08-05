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
    
    // MARK: - Propeties
    
    // MARK: - Initialize
    
    // MARK: - Life cycle
   override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    
    // MARK: - Public functions
    func configImageCell(image: UIImage) {
        imageView.image = image
    }
    // MARK: - Objc functions
    
    // MARK: - IBActions

}
