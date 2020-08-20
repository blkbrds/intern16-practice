//
//  HomeDetailTableViewCell.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol HomeDetailTableViewCellDelegate: class {
    func changeLikeButton(_ view: HomeDetailTableViewCell, neadsPerform action: HomeDetailTableViewCell.Action)
}

final class HomeDetailTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var myimageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var islikeButton: UIButton!
    
    // MARK: - Peroperties
    weak var delegate: HomeDetailTableViewCellDelegate?
    var index: Int?
    var viewModel: HomeDetailViewModel? = HomeDetailViewModel() {
        didSet {
            configTable()
        }
    }
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private functions
    private func configTable() {
        guard let mydata = viewModel?.data else { return }
        myimageView.image = UIImage(named: mydata.imageName)
        nameLabel.text = mydata.titleName
        addressLabel.text = mydata.address
        ratingLabel.text = "\(mydata.rating)/10"
        distanceLabel.text = "\(mydata.distance) km"
        if mydata.isLike {
            islikeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            islikeButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    // MARK: - @IBActions
    @IBAction private func islikeButtonTouchUpInside(_ sender: UIButton) {
        guard let islike = viewModel?.data?.isLike else { return }
        if let index = index {
            delegate?.changeLikeButton(self, neadsPerform: .changeLike(index: index, islike: islike))
        }
    }
}

extension HomeDetailTableViewCell {
    enum Action {
        case changeLike(index: Int, islike: Bool)
    }
}
