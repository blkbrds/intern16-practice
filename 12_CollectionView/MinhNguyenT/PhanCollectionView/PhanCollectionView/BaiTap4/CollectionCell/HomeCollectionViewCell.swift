//
//  HomeCollectionViewCell.swift
//  PhanCollectionView
//
//  Created by MacBook Pro on 8/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var nameImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public functions
    func updateCollectionCell(data: Data) {
        nameLabel.text = data.text
        nameImageView.image = UIImage(named: data.imageName)
    }
}
