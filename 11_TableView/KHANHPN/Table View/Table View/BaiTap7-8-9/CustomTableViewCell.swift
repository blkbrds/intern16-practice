//
//  CustomTableViewCell.swift
//  Table View
//
//  Created by Phan Ngọc Khánh on 8/6/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func customTableViewCell(_ view: CustomTableViewCell, needsPerform action: CustomTableViewCell.Action)
}

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets:
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    
    weak var delegate: CustomTableViewCellDelegate?
    
    var section: Int?, row: Int?
    
    // MARK: - Load nib
    override func awakeFromNib() {
        super.awakeFromNib()
        tapButton.layer.cornerRadius = 10
    }
    
    // MARK: - Functions:
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBAxtions:
    @IBAction func tapMeTouchUpInside(_ sender: UIButton) {
        guard let section = section else { return }
        guard let row = row else { return }
        delegate?.customTableViewCell(self, needsPerform: .tap(section: section, row: row))
    }
}

// MARK: - Extension
extension CustomTableViewCell {
    enum Action {
        case tap(section: Int, row: Int)
    }
}
