//
//  HomeCollectionViewCell.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/20/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var coffeeShopImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    
    var viewModel: HomeCellViewModel? = HomeCellViewModel() {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        guard let coffeeShop = viewModel?.coffeeShop else { return }
        nameLabel.text = coffeeShop.name
        coffeeShopImageView.image = coffeeShop.image
        addressLabel.text = coffeeShop.address
        ratingLabel.text = "\(coffeeShop.rating)/10"
        distanceLabel.text = "\(coffeeShop.distance) KM"
        if coffeeShop.isLike {
            likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    @IBAction private func likeButtonTouchUpInside(_ sender: Any) {
        viewModel?.changeLikeButton(button: sender as! UIButton)
    }

}
