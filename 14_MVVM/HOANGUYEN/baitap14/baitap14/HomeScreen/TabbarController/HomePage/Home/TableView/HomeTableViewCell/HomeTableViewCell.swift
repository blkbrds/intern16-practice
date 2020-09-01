//
//  HomeTableViewCell.swift
//  baitap14
//
//  Created by NXH on 8/14/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var imageCell: UIImageView!
    @IBOutlet private weak var nameCoffeeShopLabel: UILabel!
    @IBOutlet private weak var addressCoffeeShopLabel: UILabel!
    @IBOutlet private weak var ratingCoffeeShopLabel: UILabel!
    @IBOutlet private weak var distanceCoffeeShopLabel: UILabel!
    @IBOutlet private weak var favoritesButton: UIButton!
    
    // MARK: - Properties
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let coffee = viewModel?.coffeeShop else {
            return
        }
        nameCoffeeShopLabel.text = coffee.name
        addressCoffeeShopLabel.text = coffee.address
        ratingCoffeeShopLabel.text = coffee.rating
        distanceCoffeeShopLabel.text = String(coffee.distance)
        imageCell.image = UIImage(named: coffee.image)
        setupFavoritesButton()
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favoritesButtonTouchUpInSide(_ sender: UIButton) {
        guard let text = nameCoffeeShopLabel.text else {
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
