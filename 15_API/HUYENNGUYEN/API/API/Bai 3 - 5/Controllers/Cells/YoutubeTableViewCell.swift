//
//  YoutubeTableViewCell.swift
//  API
//
//  Created by bu on 9/8/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class YoutubeTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chanelLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    
    
    var viewModel: YoutubeTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func updateView() {
        guard let viewModel = viewModel else { return }
        if let imageURL = viewModel.thumbnailImageName {
            API.shared().dowloadImage(url: imageURL) { [weak self] (image) in
                guard let this = self else { return }
                this.thumbnailImageView.image = image
            }
        } else {
            thumbnailImageView.image = nil
        }
        titleLabel.text = viewModel.titleVideo
        chanelLabel.text = viewModel.chanelTitle
        publishedLabel.text = viewModel.publishedAt
    }
}
