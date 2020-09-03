//
//  SliderCollectionViewCell.swift
//  MVVM
//
//  Created by bu on 8/24/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class SliderCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var sliderImageView: UIImageView!
    
    // MARK: - Properties
    var viewModel: SliderViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Function
    private func updateView() {
        guard let viewModel = viewModel else { return }
        sliderImageView.image = UIImage(named: viewModel.image)
    }
}
