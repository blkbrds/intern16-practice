//
//  Bai09TableTableViewCell.swift
//  TableView
//
//  Created by bu on 8/3/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol Bai09TableTableViewCellDelegate: class {
    func viewcell(_ view: Bai09TableTableViewCell, needsPerform action: Bai09TableTableViewCell.Action)
}

class Bai09TableTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    
    // MARK: - Enum
    enum Action {
        case userTap(name: String)
    }
    
    // MARK: - delegate
    var delegate: Bai09TableTableViewCellDelegate?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Function
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTableViewCell(image: String = "", name: String, subTitle: String) {
        contactImageView.image = UIImage(named: image)
        nameLabel.text = name
        subTitleLabel.text = subTitle
    }
    
    // MARK: - Action
    @IBAction private func tapButtonTouchUpInside(_ sender: UIButton) {
        if let name = nameLabel.text {
            delegate?.viewcell(self, needsPerform: .userTap(name: name))
        }
    }
}
