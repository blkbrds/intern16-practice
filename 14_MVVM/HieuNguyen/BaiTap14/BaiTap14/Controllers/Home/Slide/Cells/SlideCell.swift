//
//  SlideCell.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/20/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class SlideCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    
    var viewModel: SlideCellViewModel? = SlideCellViewModel() {
        didSet {
            updateImage()
        }
    }
    
    private func updateImage() {
        guard let image = viewModel?.image else { return }
        imageView.image = image
    }

}
