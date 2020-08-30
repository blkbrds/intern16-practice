//
//  HomeCollectionViewCell.swift
//  MVVM
//
//  Created by bu on 8/25/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol HomeTableCellDelegate: class {
    func cell(_ cell: HomeCollectionViewCell, needsPerform action: HomeCollectionViewCell.Action)
}

class HomeCollectionViewCell: UICollectionViewCell {

    enum Action {
        case didClickFavoriteButton(Bool)
    }
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var addressLabel: UILabel!
    @IBOutlet weak private var rateLabel: UILabel!
    @IBOutlet weak private var distanceLabel: UILabel!
    @IBOutlet weak private var favoriteButton: UIButton!
    
    weak var delegate: HomeTableCellDelegate?
    var viewModel: ListCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel else { return }
        imageView.image = UIImage(named: viewModel.datas.image)
        nameLabel.text = viewModel.datas.title
        addressLabel.text = viewModel.datas.address
        rateLabel.text = viewModel.datas.rate
        distanceLabel.text = "\(viewModel.datas.distance)km"
        configFavoriteButton(isFavorite: viewModel.datas.isFavorite)
    }
    
    private func configFavoriteButton(isFavorite: Bool) {
        let image: UIImage? = viewModel?.getFavoriteImage(isFavorite: isFavorite)
        favoriteButton.setImage(image, for: .normal)
    }
    
    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        let isFavorite = viewModel.datas.isFavorite
        delegate?.cell(self, needsPerform: .didClickFavoriteButton(isFavorite))
    }
}
