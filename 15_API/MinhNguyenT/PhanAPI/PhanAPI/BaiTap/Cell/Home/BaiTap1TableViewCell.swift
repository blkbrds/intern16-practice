//
//  BaiTap1TableViewCell.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap1TableViewCell: UITableViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var thumbnailImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var releaseDate: UILabel!
    
    var viewModel: HomeCellViewModel?  {
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
        thumbnailImage.image = viewModel?.imImage
        titleLabel.text = viewModel?.titlename
        priceLabel.text = viewModel?.price
        releaseDate.text = viewModel?.releaseDate
    }
}
