//
//  DetailTableViewCell.swift
//  MVVM
//
//  Created by bu on 8/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    
    var viewModel: CommentTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel else { return }
        let comment = viewModel.dataDetailCell
        avatarImageView.image = UIImage(named: comment.imageName)
        nameLabel.text = comment.name
        commentLabel.text = comment.comment
    }
}
