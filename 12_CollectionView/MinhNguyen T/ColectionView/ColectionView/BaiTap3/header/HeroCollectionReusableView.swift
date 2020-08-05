//
//  HeroCollectionReusableView.swift
//  ColectionView
//
//  Created by MacBook Pro on 8/5/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HeroCollectionReusableView: UICollectionReusableView {

    // MARK: - @IBOulets
    @IBOutlet weak var nameHeroLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!

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
