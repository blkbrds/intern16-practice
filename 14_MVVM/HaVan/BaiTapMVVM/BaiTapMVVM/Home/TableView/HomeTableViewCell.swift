//
//  HomeTableViewCell.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    
    func view(_ view: HomeTableViewCell, needsPerfom action: HomeTableViewCell.Action)
}

final class HomeTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var coffeeImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    // MARK: - Propeties
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    weak var delegate: HomeTableViewCellDelegate?
    var position: Int?
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private functions
    private func updateView() {
        coffeeImage.image = viewModel?.image
        nameLabel.text = viewModel?.name
        addressLabel.text = viewModel?.address
        guard let rate = viewModel?.rate, let distance = viewModel?.distance else {
            return
        }
        rateLabel.text = "\(rate)/10"
        distanceLabel.text = "\(distance) km"
        if let favorite = viewModel?.favorite {
            if favorite {
                favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            } else {
                favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction private func favoriteButtonTouchUpInside(_ sender: UIButton) {
        if let favorite = viewModel?.favorite, let position = position {
            delegate?.view(self, needsPerfom: .changeFavoriteState(position: position, with: !favorite))
        }
    }
}

// MARK: - Extension
extension HomeTableViewCell {
    enum Action {
        case changeFavoriteState(position: Int, with: Bool)
    }
}
