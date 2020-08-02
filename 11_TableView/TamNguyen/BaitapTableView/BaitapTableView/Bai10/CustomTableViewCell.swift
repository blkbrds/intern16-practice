//
//  CustomTableViewCell.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/31/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOUlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    
    // MARK: - Properties
    var userInCell = UserInCell() {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private methods
    private func updateView() {
        let user = userInCell.user
        nameLabel.text = user.nameUser
        phoneNumberLabel.text = user.numberUser
        avatarImageView.image = UIImage(named: user.avatarUser)
        }
}
