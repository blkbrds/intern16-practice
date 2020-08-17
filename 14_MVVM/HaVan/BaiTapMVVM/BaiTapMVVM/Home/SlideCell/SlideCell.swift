//
//  SlideCell.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/17/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class SlideCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    // MARK: - Propeties
    var viewModel: SlideCellViewModel? {
        didSet {
            updateView()
        }
    }
    // MARK: - Initialize
    
    // MARK: - Life cycle
  override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    private func updateView() {
        imageView.image = viewModel?.image
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions


}
