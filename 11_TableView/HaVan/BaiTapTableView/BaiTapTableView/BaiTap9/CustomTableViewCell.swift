//
//  CustomTableViewCell.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func view(_ view: CustomTableViewCell, needsPerform action: CustomTableViewCell.Action)
}

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: Properties
    weak var delegate: CustomTableViewCellDelegate?
    var section: Int?
    var row: Int?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public functions
    func updateTableCell(thing: MyClass) {
        avatarImageView.image = UIImage(named: thing.avatar)
        nameLabel.text = thing.name
        descriptionLabel.text = thing.description
    }
    
    // MARK: - IBActions
    @IBAction private func tapmeButtonTouchUpInside(_ sender: UIButton) {
        guard let section = section else { return }
        guard let row = row else { return }
        delegate?.view(self, needsPerform: .tap(section: section, row: row))
    }
}

// MARK: - Extension
extension CustomTableViewCell {
    enum Action {
        case tap(section: Int, row: Int)
    }
}
