//
//  CustomTableViewCell.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var thumbnails: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var chanelTitle: UILabel!
    @IBOutlet private weak var publishedAt: UILabel!
    
    // MARK: - Propeties
    var viewModel: CellViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Initialize
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Private functions
    private func updateView() {
        thumbnails.image = viewModel?.thumbnail
        title.text = viewModel?.title
        chanelTitle.text = viewModel?.channelTitle
        publishedAt.text = viewModel?.publishedAt
    }
}
