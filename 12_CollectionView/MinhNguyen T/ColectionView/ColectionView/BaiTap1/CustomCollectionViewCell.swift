//
//  CustomCollectionViewCell.swift
//  ColectionView
//
//  Created by MacBook Pro on 8/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOulets
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public functions
    func setNumberLabel(number: String) {
        infoLabel.text = number
    }
}
