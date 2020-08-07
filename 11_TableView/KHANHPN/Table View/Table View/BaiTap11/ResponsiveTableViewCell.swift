//
//  ResponsiveTableViewCell.swift
//  Table View
//
//  Created by Phan Ngọc Khánh on 8/7/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class ResponsiveTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet:
    
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - Load nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
