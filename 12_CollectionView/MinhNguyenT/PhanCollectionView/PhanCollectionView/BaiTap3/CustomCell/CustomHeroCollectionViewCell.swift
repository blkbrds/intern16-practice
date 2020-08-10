//
//  CustomHeroCollectionViewCell.swift
//  PhanCollectionView
//
//  Created by MacBook Pro on 8/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class CustomHeroCollectionViewCell: UICollectionViewCell {

    // MARK: _ @IBOutlets
    @IBOutlet private weak var nameImageView: UIImageView!
    @IBOutlet private weak var nameHeroLabel: UILabel!
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public functions
    func updateCell(name: String, image: UIImage){
        nameHeroLabel.text = name
        nameImageView.image = image
    }
}
