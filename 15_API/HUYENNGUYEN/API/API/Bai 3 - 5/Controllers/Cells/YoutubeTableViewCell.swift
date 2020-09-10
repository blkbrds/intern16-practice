//
//  YoutubeTableViewCell.swift
//  API
//
//  Created by bu on 9/8/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class YoutubeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chanelLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: YoutubeTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    //MARK: - Function
    private func updateView() {
        guard let viewModel = viewModel else { return }
        if let imageURL = viewModel.thumbnailImageName {
            thumbnailImageView.setImage(from: imageURL)
        } else {
            thumbnailImageView.image = nil
        }
        titleLabel.text = viewModel.titleVideo
        chanelLabel.text = viewModel.chanelTitle
        publishedLabel.text = viewModel.publishedAt
    }
}
