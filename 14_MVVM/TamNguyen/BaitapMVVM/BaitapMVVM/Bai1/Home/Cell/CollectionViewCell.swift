//
//  CollectionViewCell.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/16/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoritesButton: UIButton!
    
    // MARK: - Properties
    private var flagFavoriteButton: Int = 1
    var viewmodel2 = HomeCellModel() {
        didSet {
            updateView()
        }
    }
    enum Display: Int {
        case unlike = 0
        case like = 1
    }
    
    // MARK: - Private methods
    private func updateView() {
        let item = viewmodel2.item
        titleLabel.text = item.nameCafe
        addressLabel.text = item.address
        ratingLabel.text = item.rate
        distanceLabel.text = item.distance
    }
    
    // MARK: - IBActions
    @IBAction private func favoritesButtonTouchUpInside(_sender: UIButton) {
        guard let display = Display(rawValue: flagFavoriteButton) else { return }
        switch display {
        case .like:
            favoritesButton.tintColor = .yellow
            flagFavoriteButton = 0
        default:
            favoritesButton.tintColor = .systemBlue
            flagFavoriteButton = 1
        }
    }
}
