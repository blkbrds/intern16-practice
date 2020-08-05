//
//  FoodHeaderView.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/5/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class FoodHeaderView: UICollectionReusableView {
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var foodNameLabel: UILabel!
    @IBOutlet private weak var foodImageView: UIImageView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configHeader()
    }
    
    // MARK: - Override functions
    private func configHeader() {
        foodImageView.layer.cornerRadius = 35
        foodImageView.clipsToBounds = true
        foodNameLabel.textColor = .white
    }
    
    // MARK: - Public functions
    func updateFood(with image: UIImage, name: String) {
        foodNameLabel.text = name
        foodImageView.image = image
    }
}
