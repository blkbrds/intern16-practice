//
//  Bai11TableViewCell.swift
//  TableView
//
//  Created by bu on 8/5/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol Bai11TableViewCellDelegate: class {
    func viewcell(_ view: Bai11TableViewCell)
}

class Bai11TableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var content: String = ""
    var delegate: Bai11TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(text: String) {
        contentLabel.text = text
        self.content = text
    }
    
}
