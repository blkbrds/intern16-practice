//
//  CustomHeroCollectionViewCell.swift
//  ColectionView
//
//  Created by MacBook Pro on 8/5/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class CustomHeroCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOulets
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameHeroLabel: UILabel!
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public functions
    func updateCell(name: String, image: UIImage){
        nameHeroLabel.text = name
        heroImageView.image = image
    }
}
