//
//  HomeDetailCollectionViewCell.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol HomeDetailCollectionViewCellDelegate: class {
    func changeLikeButton(_ view: HomeDetailCollectionViewCell, neadsPerform action: HomeDetailCollectionViewCell.Action)
}

final class HomeDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var islikeButton: UIButton!
    
    // MARK: - Peroperties
    weak var delegate: HomeDetailCollectionViewCellDelegate?
    var index: Int?
    var viewModel: HomeDetailViewModel? = HomeDetailViewModel() {
        didSet {
            updateCollection()
        }
    }
    
    // MARK: - Private functions
    private func updateCollection() {
        guard let mydata = viewModel?.data else { return }
        nameLabel.text = mydata.titleName
        imageView.image = UIImage(named: mydata.imageName)
        addressLabel.text = mydata.address
        ratingLabel.text = "\(mydata.rating)/10"
        distanceLabel.text = "\(mydata.distance) km"
        if mydata.isLike {
            islikeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else  {
            islikeButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    // MARK: - @IBActions
    @IBAction func islikeButtonTouchUpInside(_ sender: UIButton) {
        guard let islike = viewModel?.data?.isLike else { return }
        if let index = index {
            delegate?.changeLikeButton(self, neadsPerform: .changeLike(index: index, islike: islike))
        }
    }
}

extension HomeDetailCollectionViewCell {
    enum Action {
        case changeLike(index: Int, islike: Bool)
    }
}

