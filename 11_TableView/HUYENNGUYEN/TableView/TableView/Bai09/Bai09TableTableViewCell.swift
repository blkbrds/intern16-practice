//
//  Bai09TableTableViewCell.swift
//  TableView
//
//  Created by bu on 8/3/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol Bai09TableTableViewCellDelegate: class {
    func viewcell(_ view: Bai09TableTableViewCell)
}

class Bai09TableTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    
    var name: String = ""
    var delegate: Bai09TableTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTableViewCell(image: String, name: String, subTitle: String) {
        contactImageView.image = UIImage(named: image)
        nameLabel.text = name
        subTitleLabel.text = subTitle
        self.name = name
    }
    
}
