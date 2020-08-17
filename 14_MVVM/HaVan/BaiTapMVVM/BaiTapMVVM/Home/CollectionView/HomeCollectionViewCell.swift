//
//  HomeCollectionViewCell.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/17/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol HomeCollectionViewCellDelegate: class {
    
    func view(_ view: HomeCollectionViewCell, needsPerfom action: HomeCollectionViewCell.Action)
}
final class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var coffeeImageView: UIImageView!
    
    // MARK: - Propeties
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    var delegate: HomeCollectionViewCellDelegate?
    var position: Int?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blue.cgColor
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    private func updateView() {
        coffeeImageView.layer.borderWidth = 1
        coffeeImageView.layer.borderColor = UIColor.black.cgColor
        coffeeImageView.image = viewModel?.image
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
    
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions
    
    @IBAction func favoriteButtonTouchUpInside(_ sender: UIButton) {
        if let favorite = viewModel?.favorite, let position = position {
            delegate?.view(self, needsPerfom: .changeFavoriteState(position: position, with: !favorite))
        }
    }
    
}

extension HomeCollectionViewCell {
    enum Action {
        case changeFavoriteState(position: Int, with: Bool)
    }
}
