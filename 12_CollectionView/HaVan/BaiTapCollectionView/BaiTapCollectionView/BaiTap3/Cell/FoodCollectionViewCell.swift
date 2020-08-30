//
//  FoodCollectionViewCell.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/5/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class FoodCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var foodNameLabel: UILabel!
    @IBOutlet private weak var foodImageView: UIImageView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    // MARK: - Private functions
    private func configCell() {
        foodImageView.layer.cornerRadius = 45
        foodImageView.clipsToBounds = true
        foodNameLabel.textColor = .white
        foodNameLabel.backgroundColor = #colorLiteral(red: 0.9103992581, green: 0.4987511039, blue: 0.4610315561, alpha: 1)
        foodNameLabel.layer.cornerRadius = 20
        foodNameLabel.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    // MARK: - Public functions
    func updateFood(with image: UIImage, name: String) {
        foodNameLabel.text = name
        foodImageView.image = image
    }
}
