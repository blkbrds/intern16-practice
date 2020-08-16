//
//  HomeTableViewCell.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

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
    // MARK: - Initialize
    
    // MARK: - Life cycle
   override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
    // MARK: - Private functions
    private func updateView() {
        coffeeImage.image = viewModel?.image
        nameLabel.text = viewModel?.name
        addressLabel.text = viewModel?.address
        rateLabel.text = "\(String(describing: viewModel?.rate))/10"
        distanceLabel.text = "\(String(describing: viewModel?.distance)) km"
        if let favorite = viewModel?.favorite {
            if favorite {
                favoriteButton.imageView?.image = UIImage(systemName: "star")
            } else {
                favoriteButton.imageView?.image = UIImage(systemName: "star.fill")
            }
        }
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions
    @IBAction private func favoriteButtonTouchUpInside(_ sender: UIButton) {
        if let favorite = viewModel?.favorite {
            viewModel?.changeState(fav: !favorite)
        }
        updateView()
    }
}
