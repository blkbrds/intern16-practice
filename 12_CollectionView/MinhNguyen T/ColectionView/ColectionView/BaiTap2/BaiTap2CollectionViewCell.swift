//
//  BaiTap2CollectionViewCell.swift
//  ColectionView
//
//  Created by MacBook Pro on 8/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap2CollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOulets
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public functions
    func setNumberLabel(number: String) {
        textLabel.text = number
    }
}
