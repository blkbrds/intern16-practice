//
//  VideoTableViewCell.swift
//  BaiTap_api
//
//  Created by Abcd on 8/25/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var thumnailsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chanelLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    
    //MARK: - Properties
    var viewModel : VideoTableCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    //MARK: - Function
    func updateUI() {
        thumnailsImage.image = viewModel?.thumnails
        titleLabel.text = viewModel?.title
        chanelLabel.text = viewModel?.channelTitle
        titleLabel.text = viewModel?.title
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
