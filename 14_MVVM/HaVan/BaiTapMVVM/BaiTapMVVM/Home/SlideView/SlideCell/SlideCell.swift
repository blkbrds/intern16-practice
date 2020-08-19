//
//  SlideCell.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/19/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class SlideCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var image: UIImageView!
    
    // MARK: - Propeties
    var viewModel: SlideCellViewModel? {
        didSet {
            updateImage()
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Private functions
    private func updateImage() {
        image.image = viewModel?.image
    }
}
