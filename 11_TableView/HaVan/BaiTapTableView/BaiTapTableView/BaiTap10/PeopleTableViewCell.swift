//
//  PeopleTableViewCell.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/30/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class PeopleTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var personImageView: UIImageView!
    
    // MARK: - Public functions
    func updateCell(name: String, phone: String) {
        nameLabel.text = name
        phoneLabel.text = phone
        personImageView.image = UIImage(named: "sushi")
    }
}
