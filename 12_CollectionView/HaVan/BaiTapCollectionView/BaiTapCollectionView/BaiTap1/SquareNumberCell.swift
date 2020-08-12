//
//  SquareNumberCell.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/12/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class SquareNumberCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var numberLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        numberLabel.textColor = .white
    }
    
    // MARK: - Public functions
    func getNumber(with number: String) {
        numberLabel.text = number
    }
}
