//
//  DetailTableViewCell.swift
//  MVVM
//
//  Created by bu on 8/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class CommentTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: CommentTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Function
    private func updateView() {
        guard let viewModel = viewModel else { return }
        avatarImageView.image = UIImage(named: viewModel.imageName)
        nameLabel.text = viewModel.name
        commentLabel.text = viewModel.comment
    }
}
