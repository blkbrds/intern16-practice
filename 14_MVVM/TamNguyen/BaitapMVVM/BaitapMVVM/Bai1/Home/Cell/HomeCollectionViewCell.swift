//
//  HomeCollectionViewCell.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/13/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoritesButton: UIButton!
    @IBOutlet private weak var cafeImageView: UIImageView!
    // MARK: - Properties
    var viewModel = CollectionCellModel() {
        didSet {
            updateView()
        }
    }
    private var flagStatus: Int = 1
    private var collectionModel = CollectionViewModel()
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Private methods
        private func updateView() {
        let item = viewModel.item
        titleLabel.text = item.nameCafe
        addressLabel.text = item.address
        ratingLabel.text = item.rate
        distanceLabel.text = item.distance
    }

    // MARK: - IBActions
    @IBAction private func favoritesButtonTouchUpInSide(_ sender: UIButton) {
        collectionModel.updateStatusButton(flag: flagStatus, completion: {status in
            if status == 1 {
                favoritesButton.tintColor = .yellow
                flagStatus = 0
            }
            if status == 0 {
                favoritesButton.tintColor = .systemBlue
                flagStatus = 1
            }
        })
    }
}
