//
//  HomeCollectionViewCell.swift
//  MVVM
//
//  Created by bu on 8/25/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol HomeTableCellDelegate: class {
    func cell(_ cell: HomeCollectionViewCell, needsPerform action: HomeCollectionViewCell.Action)
}

final class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Enum
    enum Action {
        case didClickFavoriteButton(Bool)
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var addressLabel: UILabel!
    @IBOutlet weak private var rateLabel: UILabel!
    @IBOutlet weak private var distanceLabel: UILabel!
    @IBOutlet weak private var favoriteButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: HomeTableCellDelegate?
    var viewModel: HomeCollectionViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Function
    private func updateView() {
        guard let viewModel = viewModel else { return }
        imageView.image = UIImage(named: viewModel.imageName)
        nameLabel.text = viewModel.name
        addressLabel.text = viewModel.address
        rateLabel.text = viewModel.rate
        distanceLabel.text = "\(viewModel.distance)km"
        //config Favorite Button
        favoriteButton.setImage(viewModel.image, for: .normal)
    }
    
    // MARK: - Action
    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        let isFavorite = viewModel.data.isFavorite
        delegate?.cell(self, needsPerform: .didClickFavoriteButton(isFavorite))
    }
}
