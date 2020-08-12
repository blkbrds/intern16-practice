//
//  MessageTableViewCell.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class MessageTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var messageLabel: UILabel!
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public functions
    func setMessage(with message: String) {
        messageLabel.text = message
    }
}
