//
//  GardenTableViewCell.swift
//  BaiTapTableView
//
//  Created by PCI0004 on 8/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class GardenTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateTableCell(avatar: String, nameGarden: String = "", subtitle: String = "") {
        avatarImageView.image = UIImage(named: "avatar")
        nameLabel.text = nameGarden
        subtitleLabel.text = subtitle
    }

}
