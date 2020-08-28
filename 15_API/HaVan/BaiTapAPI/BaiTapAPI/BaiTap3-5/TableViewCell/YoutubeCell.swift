//
//  YoutubeCell.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/24/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class YoutubeCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var publishedAtLabel: UILabel!
    @IBOutlet private weak var channelLabel: UILabel!
    @IBOutlet private weak var thumbnailImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Propeties
    var viewModel : YoutubeCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private functions
    private func updateUI() {
        publishedAtLabel.text = viewModel?.publishedAt
        channelLabel.text = viewModel?.channel
        titleLabel.text = viewModel?.title
        thumbnailImage.image = viewModel?.thumbnail
    }
}
