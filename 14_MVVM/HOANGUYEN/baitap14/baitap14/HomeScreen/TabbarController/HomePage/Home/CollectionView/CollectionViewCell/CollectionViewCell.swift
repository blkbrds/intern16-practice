//
//  CollectionViewCell.swift
//  baitap14
//
//  Created by NXH on 8/16/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var favoritesButton: UIButton!
    
    // MARK: - Properties
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    // MARK: - Private func
    private func configCell() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
    }
    
    private func setupFavoritesButton() {
        guard let coffee = viewModel?.coffeeShop else {
            return
        }
        switch HomeViewModel.viewModel.settupFavoritesButton(text: coffee.name) {
        case true:
            favoritesButton.tintColor = .yellow
        default:
            favoritesButton.tintColor = .lightGray
        }
    }
    
    // MARK: - Public func
    private func updateView() {
        guard let coffee = viewModel?.coffeeShop else {
            return
        }
        nameLabel.text = coffee.name
        addressLabel.text = coffee.address
        ratingLabel.text = coffee.rating
        distanceLabel.text = String(coffee.distance)
        image.image = UIImage(named: coffee.image)
        setupFavoritesButton()
    }
    
    // MARK: - @IBAction
    @IBAction func favoritesButtonTouchUpInSide(_ sender: UIButton) {
        guard let text = nameLabel.text else {
            return
        }
        if let check = HomeViewModel.viewModel.getFavorites(text: text) {
            if check {
                favoritesButton.tintColor = .yellow
            } else {
                favoritesButton.tintColor = .lightGray
            }
        }
    }
}
