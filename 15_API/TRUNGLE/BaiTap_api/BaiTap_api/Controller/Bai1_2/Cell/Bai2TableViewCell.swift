//
//  Bai2TableViewCell.swift
//  BaiTap_api
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai2TableViewCell: UITableViewCell {
    //MARK: - Outlet
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    //MARK: - properties
    
    var viewModel : Bai2CellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI () {
        artistLabel.text = viewModel?.artist
        imageView1.image = viewModel?.image
        nameLabel.text = viewModel?.name
        priceLabel.text = viewModel?.price
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
