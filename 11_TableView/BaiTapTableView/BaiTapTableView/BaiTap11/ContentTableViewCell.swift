//
//  ContentTableViewCell.swift
//  BaiTapTableView
//
//  Created by PCI0004 on 8/7/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class ContentTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var contentLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTableCell(content: String = "") {
        contentLabel.text = content
    }
    
}
