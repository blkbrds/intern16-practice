//
//  HeroCollectionReusableView.swift
//  PhanCollectionView
//
//  Created by MacBook Pro on 8/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HeroCollectionReusableView: UICollectionReusableView {

    // MARK: - @IBOutlets
    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var nameHeroLabel: UILabel!
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public functions
    func updateHeader(name: String, image: UIImage) {
        nameHeroLabel.text = name
        heroImageView.image = image
    }
}
