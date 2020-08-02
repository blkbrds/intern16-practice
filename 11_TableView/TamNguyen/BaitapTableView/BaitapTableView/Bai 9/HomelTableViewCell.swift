//
//  HomelTableViewCell.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/29/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func tap(view: HomelTableViewCell)
}

final class HomelTableViewCell: UITableViewCell {
    
    // MARK: - IBOulets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: HomeTableViewCellDelegate?
    var section: Int = 0
    var row: Int = 0
    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }
    
    // MARk: - Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private methods
    private func updateView() {
        let user = viewModel.user
        nameLabel.text = user.nameUser
        avatarImageView.image = UIImage(named: user.imageUser)
        subTitleLabel.text = user.subTitle
    }
    
    // MARK: - IBACtions
    @IBAction private func tapTouchUpInside(_ sender: UIButton) {
        delegate?.tap(view: self)
    }
}
