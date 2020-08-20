//
//  CommentTableViewCell.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class CommentTableViewCell: UITableViewCell {

    // MARK:- @IBOutlets
    @IBOutlet private weak var nameUser: UILabel!
    @IBOutlet private weak var avartarImageView: UIImageView!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    
    var viewModel: CommentViewModel? = CommentViewModel() {
        didSet {
            updateComment()
        }
    }
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
        avartarImageView.layer.cornerRadius = 40
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private functions
    private func updateComment() {
        nameUser.text = viewModel?.name
        dayLabel.text = viewModel?.time
        commentLabel.text = viewModel?.comment
    }
}
