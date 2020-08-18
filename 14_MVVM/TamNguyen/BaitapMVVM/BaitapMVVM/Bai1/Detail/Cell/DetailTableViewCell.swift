//
//  DetailTableViewCell.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/17/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!

    // MARK: - Properties
    var viewModel = DetailCellModel() {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blue.cgColor
    }

    // MARK: - Private methods
    private func updateView() {
        let item = viewModel.item
        nameLabel.text = item.name
        commentLabel.text = item.comment
        timeLabel.text = item.time
    }
}
