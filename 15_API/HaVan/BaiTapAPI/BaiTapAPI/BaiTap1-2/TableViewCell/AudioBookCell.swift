//
//  AudioBookCell.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class AudioBookCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var imageBook: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    // MARK: - Propeties
    var viewModel: AudioBookCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private functions
    private func updateUI() {
        titleLabel.text = viewModel?.title
        priceLabel.text = viewModel?.price
        releaseDateLabel.text = viewModel?.releaseDate
        imageBook.image = viewModel?.image
    }
}
