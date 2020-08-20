//
//  SliderCollectionViewCell.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/16/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class SliderCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var sliderImageView: UIImageView!
    
    var viewModel: SliderCellViewModel? = SliderCellViewModel() {
        didSet {
            updateSliderCell()
        }
    }
    
    // MARK: - Private functions
    private func updateSliderCell() {
        guard let sliderdata = viewModel?.sliderData else { return }
        sliderImageView.image = UIImage(named: sliderdata.imagename)
    }
}
