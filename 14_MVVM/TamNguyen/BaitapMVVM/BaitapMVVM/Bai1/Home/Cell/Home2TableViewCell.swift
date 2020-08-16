//
//  Home2TableViewCell.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/16/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Home2TableViewCell: UITableViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoritesButton: UIButton!
    @IBOutlet private weak var cafeImageView: UIImageView!

    // MARK: - Properties
    private var flagFavoriteButton: Int = 1
    var viewModel2 = CollectionCellModel() {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Private methods
    private func updateView() {
        let item = viewModel2.item
        titleLabel.text = item.nameCafe
        addressLabel.text = item.address
        ratingLabel.text = item.rate
        distanceLabel.text = item.distance
    }
    
    // MARK: - IBActions
    @IBAction private func favoritesButtonTouchUpInside(_ sender: UIButton) {
        switch flagFavoriteButton {
        case 1:
            favoritesButton.tintColor = .yellow
            flagFavoriteButton = 0
        default:
            favoritesButton.tintColor = .systemBlue
            flagFavoriteButton = 1
        }
    }
}
