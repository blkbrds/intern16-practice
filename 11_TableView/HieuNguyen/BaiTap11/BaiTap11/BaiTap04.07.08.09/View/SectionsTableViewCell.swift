//
//  SectionsTableViewCell.swift
//  BaiTap11
//
//  Created by PCI0020 on 7/14/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

protocol SectionsTableViewCellDelegate: class {
    func getSectionName(view: SectionsTableViewCell, needPerformAction action: SectionsTableViewCell.Action)
}

final class SectionsTableViewCell: UITableViewCell {

    @IBOutlet private weak var descriptLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    
    weak var delegate: SectionsTableViewCellDelegate?
    var name: String = ""
    
    enum Action {
        case printName(name: String)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateTableViewCell(image: UIImage, name: String, description: String) {
        descriptLabel.text = description
        nameLabel.text = name
        profileImageView.image = image
        self.name = name
    }
    
    @IBAction func tamMeButtonTouchUpInside(_ sender: Any) {
        delegate?.getSectionName(view: self, needPerformAction: .printName(name: name))
    }
}
