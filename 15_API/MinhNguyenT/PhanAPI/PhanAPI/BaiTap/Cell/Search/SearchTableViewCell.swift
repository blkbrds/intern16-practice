//
//  SearchTableViewCell.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var thumbnailsImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var channelLabel: UILabel!
    @IBOutlet private weak var publishedLabel: UILabel!
    
    var viewModel: SearchCellViewModel? {
        didSet {
            updateTable()
        }
    }
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTable() {
        titleLabel.text = viewModel?.titlename
        channelLabel.text = viewModel?.channel
        publishedLabel.text = viewModel?.publlish
        thumbnailsImage.image = viewModel?.imImage
    }
}
