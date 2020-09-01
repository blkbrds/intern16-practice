//
//  CommentTableViewCell.swift
//  baitap14
//
//  Created by NXH on 8/16/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet private weak var imageCell: UIImageView!
    
    var viewModel: CommentTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateView() {
        guard let content = viewModel?.content else {
            return
        }
        commentLabel.text = content
    }
}
