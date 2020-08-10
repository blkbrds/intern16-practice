//
//  HeaderCollectionViewCell.swift
//  PhanCollectionView
//
//  Created by MacBook Pro on 8/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HeaderCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var myImageView: UIImageView!

    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public functions
    public func headerImage(image: String) {
        myImageView.image = UIImage(named: image)
    }
}
