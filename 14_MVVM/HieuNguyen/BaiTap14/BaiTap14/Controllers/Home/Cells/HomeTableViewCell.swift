//
//  HomeTableViewCell.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/17/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func likeCell(cell: HomeTableViewCell, isLike: Bool)
}

final class HomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var coffeeShopImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    
    weak var delegate: HomeTableViewCellDelegate?
    
    var viewModel: HomeCellViewModel? = HomeCellViewModel() {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        guard let coffeeShop = viewModel?.coffeeShop else { return }
        self.selectionStyle = .none
        nameLabel.text = coffeeShop.name
        coffeeShopImageView.image = coffeeShop.image
        addressLabel.text = coffeeShop.address
        ratingLabel.text = "\(coffeeShop.rating)/10"
        distanceLabel.text = "\(coffeeShop.distance) KM"
        if coffeeShop.isLike {
            likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            likeButton.tag = 1
        } else {
            likeButton.setImage(UIImage(systemName: "star"), for: .normal)
            likeButton.tag = 2
        }
    }
    
    @IBAction private func likeButtonTouchUpInside(_ sender: Any) {
        guard let coffeeShop = viewModel?.coffeeShop else { return }
        delegate?.likeCell(cell: self, isLike: !coffeeShop.isLike)
    }
}
