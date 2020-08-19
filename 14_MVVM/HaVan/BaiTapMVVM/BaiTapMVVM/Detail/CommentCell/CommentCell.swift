//
//  CommentCell.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/18/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class CommentCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    // MARK: - Propeties
    var viewModel: CommentCellViewModel? {
        didSet {
            updateCell()
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        superview?.awakeFromNib()
    }
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private functions
    private func updateCell() {
        commentLabel.text = viewModel?.comment
        nameLabel.text = viewModel?.name
        dateLabel.text = viewModel?.date
    }
}
