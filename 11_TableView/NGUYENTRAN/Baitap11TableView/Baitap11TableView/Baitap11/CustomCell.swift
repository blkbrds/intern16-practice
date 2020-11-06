//
//  CustomCell.swift
//  Baitap11TableView
//
//  Created by MBA0245P on 11/5/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func displayMessage(message: String) {
        messageLabel.text = message
    }
    
}
