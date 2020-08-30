//
//  DescriptionTableViewCell.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/18/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class DescriptionTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Propeties
    var viewModel: DescriptionCellViewModel? {
        didSet {
            updateDescription()
        }
    }
    
    // MARK: - Private functions
    private func updateDescription() {
        descriptionLabel.text = viewModel?.description
    }
}
