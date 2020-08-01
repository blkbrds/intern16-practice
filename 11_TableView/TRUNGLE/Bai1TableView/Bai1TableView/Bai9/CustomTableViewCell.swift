//
//  CustomTableViewCell.swift
//  Bai1TableView
//
//  Created by Abcd on 7/30/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit
protocol CustomTableViewCellDelegate: class {
    func clickMe(_ customTableViewCell: CustomTableViewCell)
}
class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    var delegate: CustomTableViewCellDelegate?
    var viewModel = CustomCellModel() {
        didSet {
            updateView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func tapMePressed(_ sender: Any) {
        delegate?.clickMe(self)
    }
    
    private func updateView() {
        let user = viewModel.user
        nameLabel.text  = user.userName
        avatarImageView.image = UIImage(named: user.imageView)
        subTitleLabel.text = user.subTitle
    }
}
