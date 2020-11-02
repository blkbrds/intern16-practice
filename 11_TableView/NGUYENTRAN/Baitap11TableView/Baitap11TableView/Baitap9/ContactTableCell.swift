//
//  ContactTableCell.swift
//  Baitap11TableView
//
//  Created by MBA0245P on 11/2/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class ContactTableCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTableCell(avatar: String, contactName: String = "", subtitle: String = "") {
        avatarImageView.image = UIImage(named: avatar)
        contactNameLabel.text = contactName
        subtitleLabel.text = subtitle
    }
}
